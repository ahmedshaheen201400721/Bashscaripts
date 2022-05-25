{
    sum+=$5
    if( NR==1 ){
        MIN=$5
        MIN_NAME=$9
        MAX=$5
        MAX_NAME=$9
    }
    if($5 > MAX){
        MAX=$5
        MAX_NAME=$9
    }
    if($5 < MIN){
        MIN=$5
        MIN_NAME=$9
    }
} 
END{
    print "SUM =",sum ,"bit \t",  sum/1024 , "kb\t", sum/1024/1024 , "MB \t"
    print "files: ", NR
    if(STATS==1){
        print "biggest file is \t",MAX_NAME," with size of : ", MAX
        print "smallest file is \t",MIN_NAME," with size of : ", MIN
    }
}