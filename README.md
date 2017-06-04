
##
## ROOT and R Interface on Docker
##


NOTICE 1: the source code is based on 

	[1] https://root.cern.ch/doc/master/md_bindings_r_doc_users-guide_ROOTR_Users_Guide.html

	[2] ftp://cran.r-project.org/pub/R/doc/contrib/Verzani-SimpleR.pdf

	[3] https://indico.cern.ch/event/304944/contributions/1672775/attachments/578940/797157/ROOTR_chep2015.pdf

NOTICE 2: the csv data is from https://catalog.data.gov/dataset?res_format=CSV&page=2

#


[1] download this source-code-folder

[2] cd downloaded-source-code-folder

[3] sudo docker build -t r-rootr-dev:01 .

	wait ... wait ... wait ..

[4] sudo docker run --rm --privileged  -i --name rootr -v $PWD:/home/analysis  -t "r-rootr-dev:01"  bash

[5] root@d78230338810:/# cd /home/analysis/

[6] root@d78230338810:/home/analysis# echo $PATH

	/install/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[7] root@d78230338810:/home/analysis# echo $LD_LIBRARY_PATH

	:/install/root/lib

[8] root@d78230338810:/home/analysis# cd examples

[9] root@a39fc6bb86f3:/home/analysis/examples# g++ -std=c++11  -Wall -I$ROOTSYS/include -I /usr/local/lib/R/site-library/Rcpp/include/ -I /usr/local/lib/R/site-library/RInside/include/ -I /usr/share/R/include/    -o main root_r_interface.cpp   -L$ROOTSYS/lib -lCore -lHist -lRIO -lTree -lGpad -lRGL -lRInterface -lRtools -lMatrix -lTMVA -L /usr/lib/R/lib -lR

[10] the output may look something like this

	"R version 3.2.3 (2015-12-10)"
	

	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	  0.000   0.750   2.500   2.667   4.250   7.000 
	 

	  weight height gender
	1    150     65 Female
	2    135     61 Female
	3    210     70   Male
	4    140     65 Female

	
	2x2 matrix is as follows

	     |      0    |      1    |
	-------------------------------
	   0 |          1           3 
	   1 |          2           4 
	
	
	2x2 matrix is as follows
	
	     |      0    |      1    |
	-------------------------------
	   0 |         -2         1.5 
	   1 |          1        -0.5 
	
	
	Vector (2)  is as follows
	
	     |        1  |
	------------------
	   0 |1 
	   1 |2 
	
  
	  	
	  NumTakers ReadingAvg MathAvg WritingAvg
	1        29        355     404        363
	2        91        383     423        366
	3        70        377     402        370
	4         7        414     401        359
	5        44        390     433        384
	6       112        332     557        316


	  NumTakers     ReadingAvg     MathAvg      WritingAvg 
	 s      : 57   s      : 57   s      : 57   s      : 57  
	 54     : 10   367    :  8   385    :  9   368    :  9  
	 48     :  8   370    :  8   364    :  8   370    :  9  
	 72     :  8   384    :  8   371    :  8   359    :  8  
	 9      :  8   398    :  8   381    :  8   394    :  8  
	 29     :  7   363    :  7   391    :  8   351    :  7  
	 (Other):380   (Other):382   (Other):380   (Other):380  
