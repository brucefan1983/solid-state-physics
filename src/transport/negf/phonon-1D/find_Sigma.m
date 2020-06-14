function [SigmaL,SigmaR]=find_Sigma(H00,H01,w)
H10=H01.';
gsR=find_g00(H00,H01,w);
gsL=find_g00(H00,H10,w);
SigmaR=H01*gsR*H10;
SigmaL=H10*gsL*H01;