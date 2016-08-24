#include<stdio.h>

void main()
{
    float rf[35][33];
    int i,j ,k;
    FILE *fptr1,*fptr2;

    fptr1=fopen("/home/naveen/workspace/rainfall/data/rain_data/data/binary/rf_1951.grd","rb");   // input file
    fptr2=fopen("/home/naveen/workspace/rainfall/data/rain_data/data/ascii/rf_1951.prt","w");

    if(fptr1==NULL)
    {
        printf("Can't open file");
        return 0;
    }
    if(fptr2==NULL)
    {
        printf("Can't open file");
        return 0;
    }

    k=1;
    while(fread(&rf,sizeof(rf),1,fptr1)==1)
    {
        fprintf(fptr2,"\nrecord = %d \n",k);
        k++;
        for(i=0 ; i < 35 ; i++)
        {
            fprintf(fptr2,"\n") ;
            for(j=0 ; j < 33 ; j++)
            fprintf(fptr2," %6.1f",rf[i][j] );
        }

    }
    fclose(fptr1);
    fclose(fptr2);

    return;

} /* end of main */
