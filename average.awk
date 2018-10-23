#! /usr/bin/awk -f

# dry-run
# self-ipi
# normal-ipi
# broadcast-ipi
# broadcast-lock
BEGIN {
    SUM[0]=0;
    SUM[1]=0;
    SUM[2]=0;
    SUM[3]=0;
    TOTAL[0]=0;
    TOTAL[1]=0;
    TOTAL[2]=0;
    TOTAL[3]=0;
    COUNT=0;
}

/Dry-run:/{
    SUM[0]+=$4;
    TOTAL[0]+=$5;
    COUNT++;
}

/Self-IPI:/{
    SUM[1]+=$4;
    TOTAL[1]+=$5;
}

/Normal IPI:/{
    SUM[2]+=$5;
    TOTAL[2]+=$6;
}

/Broadcast IPI:/{
    SUM[3]+=$5;
    TOTAL[3]+=$6;
}

/Broadcast lock:/{
    SUM[4]+=$5;
    TOTAL[4]+=$6;
}

END {
    printf("count = %d\n", COUNT);
    fmt="%s\t%12.2f\t%13.2f\n";
    printf(fmt, "Dry-run\t", SUM[0]/COUNT, TOTAL[0]/COUNT);
    printf(fmt, "Self-IPI", SUM[1]/COUNT, TOTAL[1]/COUNT);
    printf(fmt, "Normal IPI", SUM[2]/COUNT, TOTAL[2]/COUNT);
    printf(fmt, "Broadcast IPI", SUM[3]/COUNT, TOTAL[3]/COUNT);
    printf(fmt, "Broadcast lock", SUM[4]/COUNT, TOTAL[4]/COUNT);
}
