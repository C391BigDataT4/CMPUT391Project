import sys
import random
import string
import datetime
from cassandra.cluster import Cluster

def unix_time(dt):
    epoch = datetime.datetime.utcfromtimestamp(0)
    delta = dt - epoch
    return delta.total_seconds()

def unix_time_millis(dt):
    return long(unix_time(dt) * 1000.0)

def randomGen(data_type):
    if data_type == "int":
        return random.randint(0,100000)
    if data_type == "bigint":
        return random.randint(0,100000000000)
    elif data_type == "text":
        return ''.join(random.choice(string.ascii_lowercase) for _ in range(20))
    elif data_type == "timestamp":
        return unix_time_millis(datetime.datetime.now())
    elif data_type == "float":
        return random.uniform(1.0, 2.0)
    else:
        print "Warning! Unknown data type."
        return ""

def main(argv):

    num_days = int(argv[1])
    labels = []
    types = []

    # Read columns names and data types from file. This file is pushed to node 1 by running "setup.sh"
    with open("columns.cql") as f:
        lines = f.readlines()
    for line in lines:
        labels.append(line.split()[0])
        types.append(line.split()[1].strip(','))

    from cassandra.cluster import Cluster
    cluster = Cluster(['127.0.0.1'])
    session = cluster.connect("group4")

    query = "insert into cdr (" + "".join(label + "," for label in labels)[:-1] + ") values (" + ("?," * (len(labels) - 1)) + "?)"
    prepared = session.prepare(query)

    for i in range (num_days):
        randomData = []
        for i in range( len(labels) ):
            randomData.append( randomGen( types[i] ) )

        session.execute_async( prepared.bind(randomData) )

if __name__ == "__main__":
    main(sys.argv)



#
# results = session.execute("select * from cdr")
# for result in results:
#     print result.city_id, result.seq_num, result.imsi, result.starttime, result.latitude
