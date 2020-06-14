function [SigmaL,SigmaR]=find_Sigma(H00,H01,E) 
H10=H01.';
gsR=find_g00(H00,H01,E);
gsL=find_g00(H00,H10,E);
SigmaR=H01*gsR*H10;
SigmaL=H10*gsL*H01;