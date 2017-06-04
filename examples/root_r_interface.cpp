
#include "TMVA/MethodC50.h"
#include "TMVA/MethodRSVM.h"

#include "TMVA/Factory.h"
#include "TMVA/Tools.h"

#include<TRInterface.h>
#include<TMatrixD.h>
#include<TVector.h>
#include<TVectorD.h>
#include<stdio.h>

#include<TRDataFrame.h>
#include <cstdlib>

template<class T> T fun(T x) { return x+x; } 
//creating an instance
ROOT::R::TRInterface &r=ROOT::R::TRInterface::Instance();

int main(void){

	
	r.Execute("print(version$version.string)");

	r<<"vec=c(2,3,0,3,1,0,0,1)"; // This is valid as of R version 1.4.0.
	r<<"print(vec)";
	r<<"print(mean(vec), digits=3)";
	r<<"print(median(vec), digits=3)";
	r<<"print(var(vec), digits=3)";
	r<<"vec= c(vec,4,5,6,7)";
	r<<"print(max(vec))";
	r<<"print( sqrt(var(vec)))";
	r<<"print(sqrt( sum( (vec - mean(vec))^2 /(length(vec)-1) )))"; 
	r<<"std = function(x) sqrt(var(x))";
	r<<"print(std(vec))";
	r<<"print(vec[vec >3])";
	r<<"print(vec[c(1,2)])"; //first and second items
	r<<"print(summary(vec))";
	r<<"print(sort(vec))";
	r<<"print(table(vec))";

	r<<"weight = c(150,135,210,140)";
	r<<"height = c(65,61, 70,65)";
	r<<"gender = c('Female', 'Female', 'Male', 'Female')";
	r<<"study = data.frame(weight,height,gender)";
	r<<"print( study)";
	r<<"print( study[,'weight'])";
	r<<"print(  study[,1])";
	r<<"print( study[,1:2])";

	r<<"print (study$weight)";
	r<<"print( study[['weight']])";
	r<<"print( study[[1]])";
	r<<"print(head(study) )";

	//r<<"library(MASS)";

	r<<"mat<-matrix(c(1,2,3,4),2,2,byrow=TRUE)"; 
	 
	TMatrixD m = r.Eval("matrix(c(1,2,3,4),2,2)");
	m.Print();

	TMatrixD mInvert = m.Invert();
	mInvert.Print();

	
	std::vector<double> v = r.Eval("c(1,2)"); 

	TVector rv(2);
	rv(0) = v[0];
	rv(1) = v[1];
	rv.Print();	


	std::vector<double> v2{1,2,3,4};
	r["v2"] = v2;
	r<< "print(v2)";  
 
	r["func"] << fun<TVector>; 
	r << "print (c(0.5,1,1.5,2,2.5))";
	r << "print(func(c(0.5,1,1.5,2,2.5)))"; 

	ROOT::R::TRDataFrame SATData;
   	r<<"SATData=read.csv('SAT_Results.csv', header=TRUE, sep=',')";
	r<<"print(head(SATData))";
	r<<"SATData=SATData[3:6]";
	r<<"colnames(SATData) = c('NumTakers', 'ReadingAvg', 'MathAvg', 'WritingAvg')";
	r<<"print(head(SATData))";
	r<<"print( summary(SATData) )";

	r["SATData"]>>SATData;

	UInt_t ncols=SATData.GetNcols();
   	UInt_t nrows=SATData.GetNrows();	
}
