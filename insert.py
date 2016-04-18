import sys
import timeit
import time
from cassandra.cluster import Cluster
from cassandra.query import BatchStatement
from cassandra.concurrent import execute_concurrent_with_args

def main(argv):

    filename = argv[1]

    labels = []

    # Read columns names and data types from file. This file is pushed to node 1 by running "setup.sh"
    with open("columns.cql") as f:
        lines = f.readlines()
    for line in lines:
        labels.append(line.split()[0])

    cluster = Cluster(['10.2.3.31', "10.2.3.30", "10.2.3.5"])
    # cluster = Cluster(['10.2.2.187', "10.2.2.180", "10.2.0.157"])
    session = cluster.connect("group4")

    # query = "insert into cdr (" + "".join(label + "," for label in labels)[:-1] + ") values (" + ("?," * (len(labels) - 1)) + "?)"
    query = "insert into cdr (" + "".join(label + "," for label in labels)[:-1] + ") values ("
    # prepared = session.prepare(query)
    # prepared.consistency_level = 0

    start_time = timeit.default_timer()
    count = 0
    with open(filename) as f:
        for line in f:
            count = count + 1
            # print query + line[:-1] + ')'
            session.execute_async( query + line[:-1] + ')' )

    seconds = timeit.default_timer() - start_time
    print "%d rows inserted in " % count + str( seconds ) + " seconds.\n"


    # start_time = timeit.default_timer()
    # for n in range (num_days):
    #     batch = BatchStatement()
    #     for i in range (10):
    #         randomData = []
    #         for j in range( len(labels) ):
    #                 randomData.append( randomGen( types[j] ) )
    #         batch.add(prepared, randomData)
    #     session.execute_async( batch )
    # seconds = timeit.default_timer() - start_time

    # parameters = []
    # for i in range (100):
    #     randomData = []
    #     for i in range( len(labels) ):
    #         randomData.append( randomGen( types[i] ) )
    #     parameters.append(randomData)
    #
    # start_time = timeit.default_timer()
    #
    # for i in range (num_days):
    #     execute_concurrent_with_args(session, prepared, parameters, concurrency=100)

    # seconds = timeit.default_timer() - start_time
    #
    # print "%d rows inserted in " % (num_days*10000) + str( seconds/60 ) + " mins.\n"
    # f = open("result.log", 'w')
    # f.truncate()
    # f.write("%d rows inserted in " % (num_days*10000) + str( seconds/60 ) + " mins.\n")
    # f.close()

    time.sleep( 60 )

if __name__ == "__main__":
    main(sys.argv)
