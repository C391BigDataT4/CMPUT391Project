import sys
import timeit
import time
from cassandra.cluster import Cluster
from cassandra.concurrent import execute_concurrent_with_args

def main(argv):

    cluster = Cluster(['10.2.3.31', "10.2.3.30", "10.2.3.5"])
    # cluster = Cluster(['10.2.2.187', "10.2.2.180", "10.2.0.157"])
    session = cluster.connect("group4")

    query_1 = "SELECT SERVICE_NODE_ID FROM CDR WHERE MOBILE_ID_TYPE IN (1,2,3,4) AND CITY_ID > 1 AND CITY_ID < 5 LIMIT 100;"
    query_2 = "SELECT COUNT(SEQ_NUM) FROM CDR WHERE MOBILE_ID_TYPE = 1 AND CITY_ID =5 AND MONTH_DAY = 14 AND MSC_CODE > 1 AND MSC_CODE < 1500 LIMIT 100"
    query_3 = "SELECT SEQ_NUM FROM CDR WHERE MOBILE_ID_TYPE IN (1,3,4,5) AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) > (1,2,10,5,100) AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) < (7,20,50,9,400) LIMIT 100"
    query_4 = "SELECT GROUP_AND_COUNT(CITY_ID) FROM CDR WHERE MOBILE_ID_TYPE = 1 AND CITY_ID IN (0,1,2) AND (MONTH_DAY, MSC_CODE) >= (1,10) AND (MONTH_DAY, MSC_CODE) <= (10,20)"
    query_5 = "SELECT GROUP_AND_COUNT(MONTH_DAY) FROM CDR WHERE MOBILE_ID_TYPE = 2 AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) >= (1,1,30,7,100) AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) <= (1,10,50,9,200)"

    start_time = timeit.default_timer()
    rows = session.execute(query_1)
    seconds_1 = timeit.default_timer() - start_time
    print "Query 1 finished in " + str( seconds_1 ) + " seconds."


    start_time = timeit.default_timer()
    rows = session.execute(query_2)
    seconds_2 = timeit.default_timer() - start_time
    print "Query 2 finished in " + str( seconds_2 ) + " seconds."

    start_time = timeit.default_timer()
    rows = session.execute(query_3)
    seconds_3 = timeit.default_timer() - start_time
    print "Query 3 finished in " + str( seconds_3 ) + " seconds."

    start_time = timeit.default_timer()
    rows = session.execute(query_4)
    seconds_4 = timeit.default_timer() - start_time
    print "Query 4 finished in " + str( seconds_4 ) + " seconds."

    start_time = timeit.default_timer()
    rows = session.execute(query_5)
    seconds_5 = timeit.default_timer() - start_time
    print "Query 5 finished in " + str( seconds_5 ) + " seconds."

if __name__ == "__main__":
    main(sys.argv)
