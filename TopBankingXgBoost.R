
library(xgboost)
library(quantmod)
library(TTR)
library(Quandl)
#library(qrmdata)
??Quandl





stock_list = c("ABC.AX","AGL.AX","ALU.AX","AMC.AX","ANN.AX","APA.AX","APX.AX","AAD.AX","ASX.AX","AZJ.AX","AST.AX","AHG.AX","BOQ.AX","BPT.AX","BAL.AX","BHP.AX","BSL.AX","BXB.AX","BKW.AX","CTX.AX","CGF.AX","CQR.AX","CLW.AX","CWY.AX","COH.AX","CPU.AX","CGC.AX","CMW.AX","CSL.AX","CYB.AX","DHG.AX","DOW.AX","ECX.AX","EVN.AX","FPH.AX","FLT.AX","GUD.AX","GXY.AX","GMA.AX","GPT.AX","GXL.AX","GWA.AX","HSO.AX","ILU.AX","IGO.AX","ING.AX","IOF.AX","IFL.AX","IRE.AX","JBH.AX","JHX.AX","LNK.AX","MFG.AX","MIN.AX","MND.AX","MQG.AX","MYO.AX","NAB.AX","NCM.AX","NHF.AX","NST.AX","NVT.AX","NXT.AX","ORA.AX","ORG.AX","OSH.AX","PDL.AX","PLS.AX","PPT.AX","PTM.AX","QBE.AX","REA.AX","RIO.AX","RRL.AX","RWC.AX","SAR.AX","SCG.AX","SDA.AX","SEK.AX","SGM.AX","SGR.AX","SIG.AX","SKC.AX","SOL.AX","SRX.AX","SUL.AX","SVW.AX","SXL.AX","SYR.AX","TCL.AX","TLS.AX","TNE.AX","TWE.AX","VCX.AX","VVR.AX","WEB.AX","WHC.AX","WOW.AX","WSA.AX","XRO.AX","ABP.AX","APT.AX","ALQ.AX","AWC.AX","AMP.AX","ANZ.AX","APO.AX","ARB.AX","ALL.AX","ALX.AX","ASL.AX","API.AX","AOG.AX","BAP.AX","BGA.AX","BEN.AX","BKL.AX","BLD.AX","BRG.AX","BWP.AX","CAR.AX","CHC.AX","CNU.AX","CIM.AX","CCL.AX","CBA.AX","CTD.AX","CCP.AX","CWN.AX","CSR.AX","DXS.AX","DMP.AX","DLX.AX","EHE.AX","FXJ.AX","FBU.AX","FMG.AX","GEM.AX","GTY.AX","GMG.AX","GNC.AX","GOZ.AX","HVN.AX","IEL.AX","IPL.AX","IFN.AX","IAG.AX","IVC.AX","IPH.AX","JHG.AX","A2M.AX","LLC.AX","LYC.AX","MGR.AX","MMS.AX","MPL.AX","MTS.AX","MYX.AX","NAN.AX","NEC.AX","NSR.AX","NUF.AX","NWS.AX","OML.AX","ORE.AX","ORI.AX","OZL.AX","PGH.AX","PMV.AX","PRY.AX","QAN.AX","QUB.AX","RHC.AX","RMD.AX","RSG.AX","S32.AX","SBM.AX","SCP.AX","SDF.AX","SFR.AX","SGP.AX","SHL.AX","SIQ.AX","SKI.AX","SPK.AX","STO.AX","SUN.AX","SWM.AX","SYD.AX","TAH.AX","TGR.AX","TME.AX","URW.AX","VOC.AX","WBC.AX","WES.AX","WOR.AX","WPL.AX","WTC.AX")
#Get stock data using getSymbols call
getSymbols(stock_list)
#Dataframe for  stock for last 5 years
ABC.AX <- last(ABC.AX,"5 years")
AGL.AX <- last(AGL.AX,"5 years") 
ALU.AX <- last(ALU.AX,"5 years") 
ANN.AX <- last(ANN.AX,"5 years") 
APA.AX <- last(APA.AX,"5 years") 
#APX.AX <- last(APX.AX,"5 years") 
#AAD.AX <- last(AAD.AX,"5 years") 
ASX.AX <- last(ASX.AX,"5 years") 
#AZJ.AX <- last(AZJ.AX,"5 years") 
AST.AX <- last(AST.AX,"5 years") 
AHG.AX <- last(AHG.AX,"5 years") 
BOQ.AX <- last(BOQ.AX,"5 years") 
BPT.AX <- last(BPT.AX,"5 years") 
#BAL.AX <- last(BAL.AX,"5 years") 
BHP.AX <- last(BHP.AX,"5 years") 
BSL.AX <- last(BSL.AX,"5 years") 
BXB.AX <- last(BXB.AX,"5 years") 
BKW.AX <- last(BKW.AX,"5 years") 
CTX.AX <- last(CTX.AX,"5 years") 
CGF.AX <- last(CGF.AX,"5 years") 
CQR.AX <- last(CQR.AX,"5 years") 
#CLW.AX <- last(CLW.AX,"5 years") 
CWY.AX <- last(CWY.AX,"5 years") 
COH.AX <- last(COH.AX,"5 years") 
CPU.AX <- last(CPU.AX,"5 years") 
#CGC.AX <- last(CGC.AX,"5 years") 
CMW.AX <- last(CMW.AX,"5 years") 
CSL.AX <- last(CSL.AX,"5 years") 
#CYB.AX <- last(CYB.AX,"5 years") 
#DHG.AX <- last(DHG.AX,"5 years") 
DOW.AX <- last(DOW.AX,"5 years") 
#ECX.AX <- last(ECX.AX,"5 years") 
EVN.AX <- last(EVN.AX,"5 years") 
FPH.AX <- last(FPH.AX,"5 years") 
FLT.AX <- last(FLT.AX,"5 years") 
GUD.AX <- last(GUD.AX,"5 years") 
GXY.AX <- last(GXY.AX,"5 years") 
#GMA.AX <- last(GMA.AX,"5 years")
GPT.AX <- last(GPT.AX,"5 years")
GXL.AX <- last(GXL.AX,"5 years")
GWA.AX <- last(GWA.AX,"5 years")
GXY.AX <- last(GXY.AX,"5 years")
#HSO.AX <- last(HSO.AX,"5 years")
ILU.AX <- last(ILU.AX,"5 years")
IGO.AX <- last(IGO.AX,"5 years")
#ING.AX <- last(ING.AX,"5 years")
#IOF.AX <- last(IOF.AX,"5 years")
IFL.AX <- last(IFL.AX,"5 years")
IRE.AX <- last(IRE.AX,"5 years")
JBH.AX <- last(JBH.AX,"5 years")
JHX.AX <- last(JHX.AX,"5 years")
#LNK.AX <- last(LNK.AX,"5 years")
MFG.AX <- last(MFG.AX,"5 years")
MIN.AX <- last(MIN.AX,"5 years")
MND.AX <- last(MND.AX,"5 years")
MQG.AX <- last(MQG.AX,"5 years")
#MYO.AX <- last(MYO.AX,"5 years")
NAB.AX <- last(NAB.AX,"5 years")
NCM.AX <- last(NCM.AX,"5 years")
NHF.AX <- last(NHF.AX,"5 years")
NST.AX <- last(NST.AX,"5 years")
NVT.AX <- last(NVT.AX,"5 years")
#NXT.AX <- last(NXT.AX,"5 years")
#ORA.AX <- last(ORA.AX,"5 years")
ORG.AX <- last(ORG.AX,"5 years")
OSH.AX <- last(OSH.AX,"5 years")
PDL.AX <- last(PDL.AX,"5 years")
PLS.AX <- last(PLS.AX,"5 years")
PDL.AX <- last(PDL.AX,"5 years")
PPT.AX <- last(PPT.AX,"5 years")
PTM.AX <- last(PTM.AX,"5 years")
QBE.AX <- last(QBE.AX,"5 years")
REA.AX <- last(REA.AX,"5 years")
RIO.AX <- last(RIO.AX,"5 years")
RRL.AX <- last(RRL.AX,"5 years")
#RWC.AX <- last(RWC.AX,"5 years")
SAR.AX <- last(SAR.AX,"5 years")
#SCG.AX <- last(SCG.AX,"5 years")
#SDA.AX <- last(SDA.AX,"5 years")
SEK.AX <- last(SEK.AX,"5 years")
SGM.AX <- last(SGM.AX,"5 years")
#SGR.AX <- last(SGR.AX,"5 years")
SIG.AX <- last(SIG.AX,"5 years")
SKC.AX <- last(SKC.AX,"5 years")
SOL.AX <- last(SOL.AX,"5 years")
SRX.AX <- last(SRX.AX,"5 years")
SUL.AX <- last(SUL.AX,"5 years")
SVW.AX <- last(SVW.AX,"5 years")
SXL.AX <- last(SXL.AX,"5 years")
SVW.AX <- last(SVW.AX,"5 years")
SYR.AX <- last(SYR.AX,"5 years")
TCL.AX <- last(TCL.AX,"5 years")
TLS.AX <- last(TLS.AX,"5 years")
TNE.AX <- last(TNE.AX,"5 years")
#TWE.AX <- last(TWE.AX,"5 years")
#VCX.AX <- last(VCX.AX,"5 years")
#VVR.AX <- last(VVR.AX,"5 years")
WEB.AX <- last(WEB.AX,"5 years")
WHC.AX <- last(WHC.AX,"5 years")
WOW.AX <- last(WOW.AX,"5 years")
WSA.AX <- last(WSA.AX,"5 years")
#XRO.AX <- last(XRO.AX,"5 years")
WSA.AX <- last(WSA.AX,"5 years")
ABP.AX <- last(ABP.AX,"5 years")
#APT.AX <- last(APT.AX,"5 years")
ALQ.AX <- last(ALQ.AX,"5 years")
AWC.AX <- last(AWC.AX,"5 years")
AMP.AX <- last(AMP.AX,"5 years")
ANZ.AX <- last(ANZ.AX,"5 years")
#APO.AX <- last(APO.AX,"5 years")
ARB.AX <- last(ARB.AX,"5 years")
ALL.AX <- last(ALL.AX,"5 years")
#ALX.AX <- last(ALX.AX,"5 years")
ASL.AX <- last(ASL.AX,"5 years")
API.AX <- last(API.AX,"5 years")
AOG.AX <- last(AOG.AX,"5 years")
#BAP.AX <- last(BAP.AX,"5 years")
#BGA.AX <- last(BGA.AX,"5 years")
BEN.AX <- last(BEN.AX,"5 years")
BKL.AX <- last(BKL.AX,"5 years")
BLD.AX <- last(BLD.AX,"5 years")
BRG.AX <- last(BRG.AX,"5 years")
BWP.AX <- last(BWP.AX,"5 years")
CAR.AX <- last(CAR.AX,"5 years")
CHC.AX <- last(CHC.AX,"5 years")
#CNU.AX <- last(CNU.AX,"5 years")
CIM.AX <- last(CIM.AX,"5 years")
CCL.AX <- last(CCL.AX,"5 years")
CBA.AX <- last(CBA.AX,"5 years")
#CTD.AX <- last(CTD.AX,"5 years")
CCP.AX <- last(CCP.AX,"5 years")
CWN.AX <- last(CWN.AX,"5 years")
CSR.AX <- last(CSR.AX,"5 years")
DXS.AX <- last(DXS.AX,"5 years")
#EHE.AX <- last(EHE.AX,"5 years")
#DLX.AX <-  last(DLX.AX,"5 years")
#FXJ.AX <-  last(FXJ.AX,"5 years")
FBU.AX <-  last(FBU.AX,"5 years")
FMG.AX <-  last(FMG.AX,"5 years")
GEM.AX <-  last(GEM.AX,"5 years")
#GTY.AX <-  last(GTY.AX,"5 years")
GMG.AX <-  last(GMG.AX,"5 years")
GNC.AX <-  last(GNC.AX,"5 years")
GOZ.AX <-  last(GOZ.AX,"5 years")
HVN.AX <-  last(HVN.AX,"5 years")
#IEL.AX <-  last(IEL.AX,"5 years")
IPL.AX <-  last(IPL.AX,"5 years")
IFN.AX <-  last(IFN.AX,"5 years")
IAG.AX <-  last(IAG.AX,"5 years")
IVC.AX <-  last(IVC.AX,"5 years")
#IPH.AX <-  last(IPH.AX,"5 years")
JHG.AX <-  last(JHG.AX,"5 years")
#A2M.AX <-  last(A2M.AX,"5 years")
LLC.AX <-  last(LLC.AX,"5 years")
LYC.AX <-  last(LYC.AX,"5 years")
MGR.AX <-  last(MGR.AX,"5 years")
MMS.AX <-  last(MMS.AX,"5 years")
#MPL.AX <-  last(MPL.AX,"5 years")
MTS.AX <-  last(MTS.AX,"5 years")
MYX.AX <-  last(MYX.AX,"5 years")
NAN.AX <-  last(NAN.AX,"5 years")
#NEC.AX <-  last(NEC.AX,"5 years")
#NSR.AX <-  last(NSR.AX,"5 years")
NUF.AX <-  last(NUF.AX,"5 years")
#NWS.AX <-  last(NWS.AX,"5 years")
#OML.AX <-  last(OML.AX,"5 years")
ORE.AX <-  last(ORE.AX,"5 years")
ORI.AX <-  last(ORI.AX,"5 years")
OZL.AX <-  last(OZL.AX,"5 years")
#PGH.AX <-  last(PGH.AX,"5 years")
PMV.AX <-  last(PMV.AX,"5 years")
PRY.AX <-  last(PRY.AX,"5 years")
QAN.AX <-  last(QAN.AX,"5 years")
QUB.AX <-  last(QUB.AX,"5 years")
#RHC.AX <-  last(RHC.AX,"5 years")
RMD.AX <-  last(RMD.AX,"5 years")
RSG.AX <-  last(RSG.AX,"5 years")
#S32.AX <-  last(S32.AX,"5 years")
SBM.AX <-  last(SBM.AX,"5 years")
#SCP.AX <-  last(SCP.AX,"5 years")
#SDF.AX <-  last(SDF.AX,"5 years")
SFR.AX <-  last(SFR.AX,"5 years")
SGP.AX <-  last(SGP.AX,"5 years")
SHL.AX <-  last(SHL.AX,"5 years")
SGP.AX <-  last(SGP.AX,"5 years")
#SIQ.AX <-  last(SIQ.AX,"5 years")
SKI.AX <-  last(SKI.AX,"5 years")
SPK.AX <-  last(SPK.AX,"5 years")
STO.AX <-  last(STO.AX,"5 years")
SUN.AX <-  last(SUN.AX,"5 years")
SWM.AX <-  last(SWM.AX,"5 years")
SYD.AX <-  last(SYD.AX,"5 years")
TAH.AX <-  last(TAH.AX,"5 years")
SGP.AX <-  last(SGP.AX,"5 years")
TGR.AX <-  last(TGR.AX,"5 years")
#TME.AX <-  last(TME.AX,"5 years")
#URW.AX <-  last(URW.AX,"5 years")
VOC.AX <-  last(VOC.AX,"5 years")
WBC.AX <-  last(WBC.AX,"5 years")
WES.AX <-  last(WES.AX,"5 years")
WOR.AX <-  last(WOR.AX,"5 years")
WPL.AX <-  last(WPL.AX,"5 years")
#WTC.AX <-  last(WTC.AX,"5 years")

# #REMOVE NA'S VALUES
# cat("Found", sum(is.na(ALU.AX)), "NA's")           
# #ALU.AX <- na.omit(ALU.AX)
# ALU.AX <- na.fill(ALU.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(APA.AX)), "NA's")           
# APA.AX <- na.omit(APA.AX)
# APA.AX <- na.fill(APA.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(AHG.AX)), "NA's")           
# AHG.AX <- na.omit(AHG.AX)
# AHG.AX <- na.fill(AHG.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(BPT.AX)), "NA's")           
# BPT.AX <- na.omit(BPT.AX)
# BPT.AX <- na.fill(BPT.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(CQR.AX)), "NA's")           
# CQR.AX <- na.omit(CQR.AX)
# CQR.AX <- na.fill(CQR.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(CWY.AX)), "NA's")           
# CWY.AX <- na.omit(CWY.AX)
# CWY.AX <- na.fill(CWY.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(CMW.AX)), "NA's")           
# CMW.AX <- na.omit(CMW.AX)
# CMW.AX <- na.fill(CMW.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(DOW.AX)), "NA's")           
# DOW.AX <- na.omit(DOW.AX)
# DOW.AX <- na.fill(DOW.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(EVN.AX)), "NA's")           
# EVN.AX <- na.omit(EVN.AX)
# EVN.AX <- na.fill(EVN.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(FPH.AX)), "NA's")           
# FPH.AX <- na.omit(FPH.AX)
# FPH.AX <- na.fill(FPH.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(GUD.AX)), "NA's")           
# GUD.AX <- na.omit(GUD.AX)
# GUD.AX <- na.fill(GUD.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(GXY.AX)), "NA's")           
# GXY.AX <- na.omit(GXY.AX)
# GXY.AX <- na.fill(GXY.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(GXL.AX)), "NA's")           
# GXL.AX <- na.omit(GXL.AX)
# GXL.AX <- na.fill(GXL.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(IGO.AX)), "NA's")           
# IGO.AX <- na.omit(IGO.AX)
# IGO.AX <- na.fill(IGO.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(MFG.AX)), "NA's")           
# MFG.AX <- na.omit(MFG.AX)
# MFG.AX <- na.fill(MFG.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(MIN.AX)), "NA's")           
# MIN.AX <- na.omit(MIN.AX)
# MIN.AX <- na.fill(MIN.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(NST.AX)), "NA's")           
# NST.AX <- na.omit(NST.AX)
# NST.AX <- na.fill(NST.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(NVT.AX)), "NA's")           
# NVT.AX <- na.omit(NVT.AX)
# NVT.AX <- na.fill(NVT.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(ORG.AX)), "NA's")           
# ORG.AX <- na.omit(ORG.AX)
# ORG.AX <- na.fill(ORG.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(PLS.AX)), "NA's")           
# PLS.AX <- na.omit(PLS.AX)
# PLS.AX <- na.fill(PLS.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(QBE.AX)), "NA's")           
# QBE.AX <- na.omit(QBE.AX)
# QBE.AX <- na.fill(QBE.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(RRL.AX)), "NA's")           
# RRL.AX <- na.omit(RRL.AX)
# RRL.AX <- na.fill(RRL.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SAR.AX)), "NA's")           
# SAR.AX <- na.omit(SAR.AX)
# SAR.AX <- na.fill(SAR.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SIG.AX)), "NA's")           
# SIG.AX <- na.omit(SIG.AX)
# SIG.AX <- na.fill(SIG.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SKC.AX)), "NA's")           
# SKC.AX <- na.omit(SKC.AX)
# SKC.AX <- na.fill(SKC.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SRX.AX)), "NA's")           
# SRX.AX <- na.omit(SRX.AX)
# SRX.AX <- na.fill(SRX.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SUL.AX)), "NA's")           
# SUL.AX <- na.omit(SUL.AX)
# SUL.AX <- na.fill(SUL.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SVW.AX)), "NA's")           
# SVW.AX <- na.omit(SVW.AX)
# SVW.AX <- na.fill(SVW.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SXL.AX)), "NA's")           
# SXL.AX <- na.omit(SXL.AX)
# SXL.AX <- na.fill(SXL.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SYR.AX)), "NA's")           
# SYR.AX <- na.omit(SYR.AX)
# SYR.AX <- na.fill(SYR.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(TCL.AX)), "NA's")           
# TCL.AX <- na.omit(TCL.AX)
# TCL.AX <- na.fill(TCL.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(TNE.AX)), "NA's")           
# TNE.AX <- na.omit(TNE.AX)
# TNE.AX <- na.fill(TNE.AX, fill = 0.0)
# 
# 
# cat("Found", sum(is.na(WSA.AX)), "NA's")           
# WSA.AX <- na.omit(WSA.AX)
# WSA.AX <- na.fill(WSA.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(ASL.AX)), "NA's")           
# ASL.AX <- na.omit(ASL.AX)
# ASL.AX <- na.fill(ASL.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(AOG.AX)), "NA's")           
# AOG.AX <- na.omit(AOG.AX)
# AOG.AX <- na.fill(AOG.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(BKL.AX)), "NA's")           
# BKL.AX <- na.omit(BKL.AX)
# BKL.AX <- na.fill(BKL.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(BLD.AX)), "NA's")           
# BLD.AX <- na.omit(BLD.AX)
# BLD.AX <- na.fill(BLD.AX, fill = 0.0)
# 
# 
# cat("Found", sum(is.na(BRG.AX)), "NA's")           
# BRG.AX <- na.omit(BRG.AX)
# BRG.AX <- na.fill(BRG.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(BWP.AX)), "NA's")           
# BWP.AX <- na.omit(BWP.AX)
# BWP.AX <- na.fill(BWP.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(CHC.AX)), "NA's")           
# CHC.AX <- na.omit(CHC.AX)
# CHC.AX <- na.fill(CHC.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(CIM.AX)), "NA's")           
# CIM.AX <- na.omit(CIM.AX)
# CIM.AX <- na.fill(CIM.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(CCP.AX)), "NA's")           
# CCP.AX <- na.omit(CCP.AX)
# CCP.AX <- na.fill(CCP.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(FBU.AX)), "NA's")           
# FBU.AX <- na.omit(FBU.AX)
# FBU.AX <- na.fill(FBU.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(FMG.AX)), "NA's")           
# FMG.AX <- na.omit(FMG.AX)
# FMG.AX <- na.fill(FMG.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(GEM.AX)), "NA's")           
# GEM.AX <- na.omit(GEM.AX)
# GEM.AX <- na.fill(GEM.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(GOZ.AX)), "NA's")           
# GOZ.AX <- na.omit(GOZ.AX)
# GOZ.AX <- na.fill(GOZ.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(LLC.AX)), "NA's")           
# LLC.AX <- na.omit(LLC.AX)
# LLC.AX <- na.fill(LLC.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(LYC.AX)), "NA's")           
# LYC.AX <- na.omit(LYC.AX)
# LYC.AX <- na.fill(LYC.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(MGR.AX)), "NA's")           
# MGR.AX <- na.omit(MGR.AX)
# MGR.AX <- na.fill(MGR.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(MYX.AX)), "NA's")           
# MYX.AX <- na.omit(MYX.AX)
# MYX.AX <- na.fill(MYX.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(NAN.AX)), "NA's")           
# NAN.AX <- na.omit(NAN.AX)
# NAN.AX <- na.fill(NAN.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(NUF.AX)), "NA's")           
# NUF.AX <- na.omit(NUF.AX)
# NUF.AX <- na.fill(NUF.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(ORE.AX)), "NA's")           
# ORE.AX <- na.omit(ORE.AX)
# ORE.AX <- na.fill(ORE.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(QUB.AX)), "NA's")           
# QUB.AX <- na.omit(QUB.AX)
# QUB.AX <- na.fill(QUB.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SFR.AX)), "NA's")           
# SFR.AX <- na.omit(SFR.AX)
# SFR.AX <- na.fill(SFR.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SKI.AX)), "NA's")           
# SKI.AX <- na.omit(SKI.AX)
# SKI.AX <- na.fill(SKI.AX, fill = 0.0)
# 
# 
# cat("Found", sum(is.na(STO.AX)), "NA's")           
# STO.AX <- na.omit(STO.AX)
# STO.AX <- na.fill(STO.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SWM.AX)), "NA's")           
# SWM.AX <- na.omit(SWM.AX)
# SWM.AX <- na.fill(SWM.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(SYD.AX)), "NA's")           
# SYD.AX <- na.omit(SYD.AX)
# SYD.AX <- na.fill(SYD.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(TAH.AX)), "NA's")           
# TAH.AX <- na.omit(TAH.AX)
# TAH.AX <- na.fill(TAH.AX, fill = 0.0)
# 
# cat("Found", sum(is.na(VOC.AX)), "NA's")           
# VOC.AX <- na.omit(VOC.AX)
# VOC.AX <- na.fill(VOC.AX, fill = 0.0)

#Lets Visualise the data
library(highcharter)
#Highcharter charts are look really good on the eyes
highchart(type = "stock") %>% hc_add_series(ANZ.AX,type="ohlc")%>% 
  hc_add_series(WBC.AX,type="ohlc") %>% hc_add_series(CBA.AX, type="ohlc") %>%hc_add_series(QAN.AX, type="ohlc") %>% hc_add_series(WOW.AX, type="ohlc") %>%hc_add_series(WPL.AX, type="ohlc") %>% hc_add_series(WOR.AX, type="ohlc") %>%hc_add_series(LLC.AX, type="ohlc") %>% hc_add_series(RMD.AX, type="ohlc") %>%hc_add_series(GMG.AX, type="ohlc") %>% hc_add_series(GNC.AX, type="ohlc") %>%hc_legend(enabled=TRUE) %>% hc_title(text="OHLC Prices For The Last 5 Years")

#Relative Strength Indicator
rsiABC <-RSI(ABC.AX$ABC.AX.Close, n=14, maType = "WMA")
plot(rsiABC, type = 'l')
rsiAGL <-RSI(AGL.AX$AGL.AX.Close, n=14, maType = "WMA")
plot(rsiAGL, type = 'l')
rsiALU <-RSI(ALU.AX$ALU.AX.Close, n=14, maType = "WMA")
plot(rsiALU, type = 'l')
rsiANN <-RSI(ANN.AX$ANN.AX.Close, n=14, maType = "WMA")
plot(rsiANN, type = 'l')
rsiAPA <-RSI(APA.AX$APA.AX.Close, n=14, maType = "WMA")
plot(rsiAPA, type = 'l')

rsiASX <-RSI(ASX.AX$ASX.AX.Close, n=14, maType = "WMA")
plot(rsiASX, type = 'l')
rsiAST <-RSI(AST.AX$AST.AX.Close, n=14, maType = "WMA")
plot(rsiAST, type = 'l')
rsiAHG <-RSI(AHG.AX$AHG.AX.Close, n=14, maType = "WMA")
plot(rsiAHG, type = 'l')
rsiBOQ <-RSI(BOQ.AX$BOQ.AX.Close, n=14, maType = "WMA")
plot(rsiBOQ, type = 'l')
rsiBPT <-RSI(BPT.AX$BPT.AX.Close, n=14, maType = "WMA")
plot(rsiBPT, type = 'l')

rsiBXB  <- RSI(BXB.AX$BXB.AX.Close, n=14, maType = "WMA")
plot(rsiBXB, type = 'l')
rsiBHP  <- RSI(BHP.AX$BHP.AX.Close, n=14, maType = "WMA")
plot(rsiBHP, type = 'l')
rsiBKW <-RSI(BKW.AX$BKW.AX.Close, n=14, maType = "WMA")
plot(rsiBKW, type = 'l')
rsiBSL <-RSI(BSL.AX$BSL.AX.Close, n=14, maType = "WMA")
plot(rsiBSL, type = 'l')
rsiCTX <-RSI(CTX.AX$CTX.AX.Close, n=14, maType = "WMA")
plot(rsiCTX, type = 'l')
rsiCGF <-RSI(CGF.AX$CGF.AX.Close, n=14, maType = "WMA")
plot(rsiCGF, type = 'l')

rsiCQR <-RSI(CQR.AX$CQR.AX.Close, n=14, maType = "WMA")
plot(rsiCQR, type = 'l')
rsiCWY <-RSI(CWY.AX$CWY.AX.Close, n=14, maType = "WMA")
plot(rsiCWY, type = 'l')
rsiCOH <-RSI(COH.AX$COH.AX.Close, n=14, maType = "WMA")
plot(rsiCOH, type = 'l')
rsiCPU <-RSI(CPU.AX$CPU.AX.Close, n=14, maType = "WMA")
plot(rsiCPU, type = 'l')
rsiCMW <-RSI(CMW.AX$CMW.AX.Close, n=14, maType = "WMA")
plot(rsiCMW, type = 'l')

rsiCSL <-RSI(CSL.AX$CSL.AX.Close, n=14, maType = "WMA")
plot(rsiCSL, type = 'l')
rsiDOW <-RSI(DOW.AX$DOW.AX.Close, n=14, maType = "WMA")
plot(rsiDOW, type = 'l')
rsiEVN <-RSI(EVN.AX$EVN.AX.Close, n=14, maType = "WMA")
plot(rsiEVN, type = 'l')
rsiFPH <-RSI(FPH.AX$FPH.AX.Close, n=14, maType = "WMA")
plot(rsiFPH, type = 'l')
rsiFLT <-RSI(FLT.AX$FLT.AX.Close, n=14, maType = "WMA")
plot(rsiFLT, type = 'l')


rsiGUD <-RSI(GUD.AX$GUD.AX.Close, n=14, maType = "WMA")
plot(rsiGUD, type = 'l')
rsiGXY <-RSI(GXY.AX$GXY.AX.Close, n=14, maType = "WMA")
plot(rsiGXY, type = 'l')
rsiGPT <-RSI(GPT.AX$GPT.AX.Close, n=14, maType = "WMA")
plot(rsiGPT, type = 'l')
rsiGXL <-RSI(GXL.AX$GXL.AX.Close, n=14, maType = "WMA")
plot(rsiBSL, type = 'l')
rsiGWA <-RSI(GWA.AX$GWA.AX.Close, n=14, maType = "WMA")
plot(rsiGWA, type = 'l')

rsiGXY <-RSI(GXY.AX$GXY.AX.Close, n=14, maType = "WMA")
plot(rsiGXY, type = 'l')
#rsiILU <-RSI(ILU.AX$ILU.AX.Close, n=14, maType = "WMA")
#plot(rsiILU, type = 'l')
rsiIFL <-RSI(IFL.AX$IFL.AX.Close, n=14, maType = "WMA")
plot(rsiIFL, type = 'l')
rsiIRE <-RSI(IRE.AX$IRE.AX.Close, n=14, maType = "WMA")
plot(rsiIRE, type = 'l')
rsiJBH <-RSI(JBH.AX$JBH.AX.Close, n=14, maType = "WMA")
plot(rsiJBH, type = 'l')

rsiJHX <-RSI(JHX.AX$JHX.AX.Close, n=14, maType = "WMA")
plot(rsiJHX, type = 'l')
#rsiMFG <-RSI(MFG.AX$MFG.AX.Close, n=14, maType = "WMA")
#plot(rsiBSL, type = 'l')
#rsiMIN <-RSI(MIN.AX$MIN.AX.Close, n=14, maType = "WMA")
#plot(rsiMIN, type = 'l')
rsiMND<-RSI(MND.AX$MND.AX.Close, n=14, maType = "WMA")
plot(rsiMND, type = 'l')
rsiMQG <-RSI(MQG.AX$MQG.AX.Close, n=14, maType = "WMA")
plot(rsiMQG, type = 'l')

rsiNAB <-RSI(NAB.AX$NAB.AX.Close, n=14, maType = "WMA")
plot(rsiNAB, type = 'l')
rsiNCM <-RSI(NCM.AX$NCM.AX.Close, n=14, maType = "WMA")
plot(rsiNCM, type = 'l')
rsiNHF <-RSI(NHF.AX$NHF.AX.Close, n=14, maType = "WMA")
plot(rsiNHF, type = 'l')
rsiNST <-RSI(NST.AX$NST.AX.Close, n=14, maType = "WMA")
plot(rsiNST, type = 'l')
rsiNVT <-RSI(NVT.AX$NVT.AX.Close, n=14, maType = "WMA")
plot(rsiNVT, type = 'l')

rsiORG <-RSI(ORG.AX$ORG.AX.Close, n=14, maType = "WMA")
plot(rsiORG, type = 'l')
rsiOSH <-RSI(OSH.AX$OSH.AX.Close, n=14, maType = "WMA")
plot(rsiOSH, type = 'l')
rsiPDL <-RSI(PDL.AX$PDL.AX.Close, n=14, maType = "WMA")
plot(rsiPDL, type = 'l')
rsiPLS <-RSI(PLS.AX$PLS.AX.Close, n=14, maType = "WMA")
plot(rsiPLS, type = 'l')
rsiPDL <-RSI(PDL.AX$PDL.AX.Close, n=14, maType = "WMA")
plot(rsiPDL, type = 'l')

rsiPPT <-RSI(PPT.AX$PPT.AX.Close, n=14, maType = "WMA")
plot(rsiPPT, type = 'l')
rsiPTM <-RSI(PTM.AX$PTM.AX.Close, n=14, maType = "WMA")
plot(rsiPTM, type = 'l')
rsiQBE <-RSI(QBE.AX$QBE.AX.Close, n=14, maType = "WMA")
plot(rsiQBE, type = 'l')
rsiREA <-RSI(REA.AX$REA.AX.Close, n=14, maType = "WMA")
plot(rsiREA, type = 'l')
rsiRIO <-RSI(RIO.AX$RIO.AX.Close, n=14, maType = "WMA")
plot(rsiRIO, type = 'l')

#rsiRRL <-RSI(RRL.AX$RRL.AX.Close, n=14, maType = "WMA")
#plot(rsiPPT, type = 'l')
rsiSAR <-RSI(SAR.AX$SAR.AX.Close, n=14, maType = "WMA")
plot(rsiSAR, type = 'l')
rsiSEK <-RSI(SEK.AX$SEK.AX.Close, n=14, maType = "WMA")
plot(rsiSEK, type = 'l')
rsiSGM <-RSI(SGM.AX$SGM.AX.Close, n=14, maType = "WMA")
plot(rsiSGM, type = 'l')
rsiSIG <-RSI(SIG.AX$SIG.AX.Close, n=14, maType = "WMA")
plot(rsiSIG, type = 'l')

rsiSKC <-RSI(SKC.AX$SKC.AX.Close, n=14, maType = "WMA")
plot(rsiSKC, type = 'l')
#rsiSRX <-RSI(SRX.AX$SRX.AX.Close, n=14, maType = "WMA")
#plot(rsiSRX, type = 'l')
rsiSUL <-RSI(SUL.AX$SUL.AX.Close, n=14, maType = "WMA")
plot(rsiSUL, type = 'l')
rsiSXL <-RSI(SXL.AX$SXL.AX.Close, n=14, maType = "WMA")
plot(rsiSXL, type = 'l')
rsiSVW <-RSI(SVW.AX$SVW.AX.Close, n=14, maType = "WMA")
plot(rsiSVW, type = 'l')


rsiSYR <-RSI(SYR.AX$SYR.AX.Close, n=14, maType = "WMA")
plot(rsiSYR, type = 'l')
#rsiTLC <-RSI(TCL.AX$TCL.AX.Close, n=14, maType = "WMA")
#plot(rsiTLC, type = 'l')
rsiTLS <-RSI(TLS.AX$TLS.AX.Close, n=14, maType = "WMA")
plot(rsiTLS, type = 'l')
rsiTNE <-RSI(TNE.AX$TNE.AX.Close, n=14, maType = "WMA")
plot(rsiSYR, type = 'l')

rsiWEB <-RSI(WEB.AX$WEB.AX.Close, n=14, maType = "WMA")
plot(rsiWEB, type = 'l')
rsiWHC <-RSI(WHC.AX$WHC.AX.Close, n=14, maType = "WMA")
plot(rsiWHC, type = 'l')
rsiWOW <-RSI(WOW.AX$WOW.AX.Close, n=14, maType = "WMA")
plot(rsiWOW, type = 'l')
rsiWSA <-RSI(WSA.AX$WSA.AX.Close, n=14, maType = "WMA")
plot(rsiWSA, type = 'l')
rsiABP <-RSI(ABP.AX$ABP.AX.Close, n=14, maType = "WMA")
plot(rsiABP, type = 'l')


rsiALQ <-RSI(ALQ.AX$ALQ.AX.Close, n=14, maType = "WMA")
plot(rsiALQ, type = 'l')
rsiAWC <-RSI(AWC.AX$AWC.AX.Close, n=14, maType = "WMA")
plot(rsiAWC, type = 'l')
rsiAMP <-RSI(AMP.AX$AMP.AX.Close, n=14, maType = "WMA")
plot(rsiAMP, type = 'l')
rsiANZ <-RSI(ANZ.AX$ANZ.AX.Close, n=14, maType = "WMA")
plot(rsiANZ, type = 'l')
rsiARB <-RSI(ARB.AX$ARB.AX.Close, n=14, maType = "WMA")
plot(rsiARB, type = 'l')

rsiALL <-RSI(ALL.AX$ALL.AX.Close, n=14, maType = "WMA")
plot(rsiALL, type = 'l')
rsiASL <-RSI(ASL.AX$ASL.AX.Close, n=14, maType = "WMA")
plot(rsiAWC, type = 'l')
rsiAPI <-RSI(API.AX$API.AX.Close, n=14, maType = "WMA")
plot(rsiAPI, type = 'l')
rsiAOG <-RSI(AOG.AX$AOG.AX.Close, n=14, maType = "WMA")
plot(rsiAOG, type = 'l')
rsiBEN <-RSI(BEN.AX$BEN.AX.Close, n=14, maType = "WMA")
plot(rsiBEN, type = 'l')


rsiBKL <-RSI(BKL.AX$BKL.AX.Close, n=14, maType = "WMA")
plot(rsiBKL, type = 'l')
rsiBLD <-RSI(BLD.AX$BLD.AX.Close, n=14, maType = "WMA")
plot(rsiBLD, type = 'l')
rsiBRG <-RSI(BRG.AX$BRG.AX.Close, n=14, maType = "WMA")
plot(rsiBRG, type = 'l')
rsiBWP <-RSI(BWP.AX$BWP.AX.Close, n=14, maType = "WMA")
plot(rsiBWP, type = 'l')
rsiCAR <-RSI(CAR.AX$CAR.AX.Close, n=14, maType = "WMA")
plot(rsiCAR, type = 'l')

rsiCHC <-RSI(CHC.AX$CHC.AX.Close, n=14, maType = "WMA")
plot(rsiCHC, type = 'l')
rsiCIM <-RSI(CIM.AX$CIM.AX.Close, n=14, maType = "WMA")
plot(rsiCIM, type = 'l')
rsiCCL <-RSI(CCL.AX$CCL.AX.Close, n=14, maType = "WMA")
plot(rsiCCL, type = 'l')
rsiCBA <-RSI(CBA.AX$CBA.AX.Close, n=14, maType = "WMA")
plot(rsiCBA, type = 'l')
rsiCCP <-RSI(CCP.AX$CCP.AX.Close, n=14, maType = "WMA")
plot(rsiCCP, type = 'l')


rsiCWN <-RSI(CWN.AX$CWN.AX.Close, n=14, maType = "WMA")
plot(rsiCWN, type = 'l')
rsiCSR <-RSI(CSR.AX$CSR.AX.Close, n=14, maType = "WMA")
plot(rsiCSR, type = 'l')
rsiDXS <-RSI(DXS.AX$DXS.AX.Close, n=14, maType = "WMA")
plot(rsiDXS, type = 'l')
rsiFBU <-RSI(FBU.AX$FBU.AX.Close, n=14, maType = "WMA")
plot(rsiFBU, type = 'l')
rsiFMG <-RSI(FMG.AX$FMG.AX.Close, n=14, maType = "WMA")
plot(rsiFMG, type = 'l')

rsiPMV <-RSI(PMV.AX$PMV.AX.Close, n=14, maType = "WMA")
plot(rsiPMV, type = 'l')

rsiGEM <-RSI(GEM.AX$GEM.AX.Close, n=14, maType = "WMA")
plot(rsiGEM, type = 'l')
rsiGMG <-RSI(GMG.AX$GMG.AX.Close, n=14, maType = "WMA")
plot(rsiGMG, type = 'l')
rsiGNC <-RSI(GNC.AX$GNC.AX.Close, n=14, maType = "WMA")
plot(rsiGNC, type = 'l')
rsiGOZ <-RSI(GOZ.AX$GOZ.AX.Close, n=14, maType = "WMA")
plot(rsiGOZ, type = 'l')
rsiHVN <-RSI(HVN.AX$HVN.AX.Close, n=14, maType = "WMA")
plot(rsiHVN, type = 'l')


rsiIPL <-RSI(IPL.AX$IPL.AX.Close, n=14, maType = "WMA")
plot(rsiIPL, type = 'l')
rsiIFN <-RSI(IFN.AX$IFN.AX.Close, n=14, maType = "WMA")
plot(rsiIFN, type = 'l')
rsiIAG <-RSI(IAG.AX$IAG.AX.Close, n=14, maType = "WMA")
plot(rsiIAG, type = 'l')
rsiIVC <-RSI(IVC.AX$IVC.AX.Close, n=14, maType = "WMA")
plot(rsiGOZ, type = 'l')
rsiJHG <-RSI(JHG.AX$JHG.AX.Close, n=14, maType = "WMA")
plot(rsiJHG, type = 'l')


rsiLLC <-RSI(LLC.AX$LLC.AX.Close, n=14, maType = "WMA")
plot(rsiLLC, type = 'l')
rsiLYC <-RSI(LYC.AX$LYC.AX.Close, n=14, maType = "WMA")
plot(rsiLYC, type = 'l')
rsiIAG <-RSI(IAG.AX$IAG.AX.Close, n=14, maType = "WMA")
plot(rsiIAG, type = 'l')
rsiIVC <-RSI(IVC.AX$IVC.AX.Close, n=14, maType = "WMA")
plot(rsiGOZ, type = 'l')
rsiMGR <-RSI(MGR.AX$MGR.AX.Close, n=14, maType = "WMA")
plot(rsiMGR, type = 'l')

rsiMMS <-RSI(MMS.AX$MMS.AX.Close, n=14, maType = "WMA")
plot(rsiMMS, type = 'l')
rsiMTS <-RSI(MTS.AX$MTS.AX.Close, n=14, maType = "WMA")
plot(rsiMTS, type = 'l')
rsiMYX <-RSI(MYX.AX$MYX.AX.Close, n=14, maType = "WMA")
plot(rsiMYX, type = 'l')
rsiNAN <-RSI(NAN.AX$NAN.AX.Close, n=14, maType = "WMA")
plot(rsiGOZ, type = 'l')
rsiNUF <-RSI(NUF.AX$NUF.AX.Close, n=14, maType = "WMA")
plot(rsiNUF, type = 'l')

rsiORE <-RSI(ORE.AX$ORE.AX.Close, n=14, maType = "WMA")
plot(rsiORE, type = 'l')
rsiORI <-RSI(ORI.AX$ORI.AX.Close, n=14, maType = "WMA")
plot(rsiORI, type = 'l')
rsiOZL <-RSI(OZL.AX$OZL.AX.Close, n=14, maType = "WMA")
plot(rsiOZL, type = 'l')
#rsiPVM <-RSI(PMV.AX$PMV.AX.Close, n=14, maType = "WMA")
#plot(rsiPVM, type = 'l')
rsiPRY <-RSI(PRY.AX$PRY.AX.Close, n=14, maType = "WMA")
plot(rsiPRY, type = 'l')

rsiQAN <-RSI(QAN.AX$QAN.AX.Close, n=14, maType = "WMA")
plot(rsiQAN, type = 'l')
rsiQUB <-RSI(QUB.AX$QUB.AX.Close, n=14, maType = "WMA")
plot(rsiQUB, type = 'l')
rsiRMD <-RSI(RMD.AX$RMD.AX.Close, n=14, maType = "WMA")
plot(rsiRMD, type = 'l')
rsiRSG <-RSI(RSG.AX$RSG.AX.Close, n=14, maType = "WMA")
plot(rsiRSG, type = 'l')
rsiSBM <-RSI(SBM.AX$SBM.AX.Close, n=14, maType = "WMA")
plot(rsiSBM, type = 'l')

rsiSFR <-RSI(SFR.AX$SFR.AX.Close, n=14, maType = "WMA")
plot(rsiSFR, type = 'l')
rsiSGP <-RSI(SGP.AX$SGP.AX.Close, n=14, maType = "WMA")
plot(rsiSGP, type = 'l')
rsiSHL <-RSI(SHL.AX$SHL.AX.Close, n=14, maType = "WMA")
plot(rsiSHL, type = 'l')
rsiSGP <-RSI(SGP.AX$SGP.AX.Close, n=14, maType = "WMA")
plot(rsiSGP, type = 'l')
rsiSKI <-RSI(SKI.AX$SKI.AX.Close, n=14, maType = "WMA")
plot(rsiSKI, type = 'l')

rsiSPK <-RSI(SPK.AX$SPK.AX.Close, n=14, maType = "WMA")
plot(rsiSPK, type = 'l')
rsiSTO <-RSI(STO.AX$STO.AX.Close, n=14, maType = "WMA")
plot(rsiSTO, type = 'l')
rsiSUN <-RSI(SUN.AX$SUN.AX.Close, n=14, maType = "WMA")
plot(rsiSUN, type = 'l')
rsiSWM <-RSI(SWM.AX$SWM.AX.Close, n=14, maType = "WMA")
plot(rsiSWM, type = 'l')
rsiSYD <-RSI(SYD.AX$SYD.AX.Close, n=14, maType = "WMA")
plot(rsiSYD, type = 'l')

rsiTAH <-RSI(TAH.AX$TAH.AX.Close, n=14, maType = "WMA")
plot(rsiTAH, type = 'l')
rsiSGP <-RSI(SGP.AX$SGP.AX.Close, n=14, maType = "WMA")
plot(rsiSGP, type = 'l')
rsiTGR <-RSI(TGR.AX$TGR.AX.Close, n=14, maType = "WMA")
plot(rsiTGR, type = 'l')
rsiVOC <-RSI(VOC.AX$VOC.AX.Close, n=14, maType = "WMA")
plot(rsiVOC, type = 'l')
rsiWBC <-RSI(WBC.AX$WBC.AX.Close, n=14, maType = "WMA")
plot(rsiWBC, type = 'l')

rsiWES <-RSI(WES.AX$WES.AX.Close, n=14, maType = "WMA")
plot(rsiWES, type = 'l')
rsiWOR <-RSI(WOR.AX$WOR.AX.Close, n=14, maType = "WMA")
plot(rsiWOR, type = 'l')
rsiWPL <-RSI(WPL.AX$WPL.AX.Close, n=14, maType = "WMA")
plot(rsiWPL, type = 'l')


#close to close
#open and close 
#rolling average (median)

#Average Directional Indicator
adxABC <- data.frame(ADX(ABC.AX[,c("ABC.AX.High","ABC.AX.Low","ABC.AX.Close")]))
plot(adxABC$ADX,type = 'l')
adxAGL <- data.frame(ADX(AGL.AX[,c("AGL.AX.High","AGL.AX.Low","AGL.AX.Close")]))
plot(adxAGL$ADX,type = 'l')
adxALU <- data.frame(ADX(ALU.AX[,c("ALU.AX.High","ALU.AX.Low","ALU.AX.Close")]))
plot(adxALU$ADX,type = 'l')
adxANN <- data.frame(ADX(ANN.AX[,c("ANN.AX.High","ANN.AX.Low","ANN.AX.Close")]))
plot(adxANN$ADX,type = 'l')
adxAPA <- data.frame(ADX(APA.AX[,c("APA.AX.High","APA.AX.Low","APA.AX.Close")]))
plot(adxAPA$ADX,type = 'l')


adxASX <- data.frame(ADX(ASX.AX[,c("ASX.AX.High","ASX.AX.Low","ASX.AX.Close")]))
plot(adxASX$ADX,type = 'l')
adxAST <- data.frame(ADX(AST.AX[,c("AST.AX.High","AST.AX.Low","AST.AX.Close")]))
plot(adxAST$ADX,type = 'l')
adxAHG <- data.frame(ADX(AHG.AX[,c("AHG.AX.High","AHG.AX.Low","AHG.AX.Close")]))
plot(adxAHG$ADX,type = 'l')
adxBOQ <- data.frame(ADX(BOQ.AX[,c("BOQ.AX.High","BOQ.AX.Low","BOQ.AX.Close")]))
plot(adxBOQ$ADX,type = 'l')
adxBPT <- data.frame(ADX(BPT.AX[,c("BPT.AX.High","BPT.AX.Low","BPT.AX.Close")]))
plot(adxBPT$ADX,type = 'l')


adxBHP <- data.frame(ADX(BHP.AX[,c("BHP.AX.High","BHP.AX.Low","BHP.AX.Close")]))
plot(adxBHP$ADX,type = 'l')
adxBSL <- data.frame(ADX(BSL.AX[,c("BSL.AX.High","BSL.AX.Low","BSL.AX.Close")]))
plot(adxBSL$ADX,type = 'l')
adxBXB <- data.frame(ADX(BXB.AX[,c("BXB.AX.High","BXB.AX.Low","BXB.AX.Close")]))
plot(adxBXB$ADX,type = 'l')
adxBKW <- data.frame(ADX(BKW.AX[,c("BKW.AX.High","BKW.AX.Low","BKW.AX.Close")]))
plot(adxBKW$ADX,type = 'l')
adxCTX <- data.frame(ADX(CTX.AX[,c("CTX.AX.High","CTX.AX.Low","CTX.AX.Close")]))
plot(adxCTX$ADX,type = 'l')


adxCGF <- data.frame(ADX(CGF.AX[,c("CGF.AX.High","CGF.AX.Low","CGF.AX.Close")]))
plot(adxCGF$ADX,type = 'l')
adxCQR <- data.frame(ADX(CQR.AX[,c("CQR.AX.High","CQR.AX.Low","CQR.AX.Close")]))
plot(adxCQR$ADX,type = 'l')
adxCWY <- data.frame(ADX(CWY.AX[,c("CWY.AX.High","CWY.AX.Low","CWY.AX.Close")]))
plot(adxCWY$ADX,type = 'l')
adxCOH <- data.frame(ADX(COH.AX[,c("COH.AX.High","COH.AX.Low","COH.AX.Close")]))
plot(adxCOH$ADX,type = 'l')
adxCPU <- data.frame(ADX(CPU.AX[,c("CPU.AX.High","CPU.AX.Low","CPU.AX.Close")]))
plot(adxCPU$ADX,type = 'l')
adxCMW <- data.frame(ADX(CMW.AX[,c("CMW.AX.High","CMW.AX.Low","CMW.AX.Close")]))
plot(adxCMW$ADX,type = 'l')

adxCSL <- data.frame(ADX(CSL.AX[,c("CSL.AX.High","CSL.AX.Low","CSL.AX.Close")]))
plot(adxCSL$ADX,type = 'l')
adxDOW <- data.frame(ADX(DOW.AX[,c("DOW.AX.High","DOW.AX.Low","DOW.AX.Close")]))
plot(adxDOW$ADX,type = 'l')
adxEVN <- data.frame(ADX(EVN.AX[,c("EVN.AX.High","EVN.AX.Low","EVN.AX.Close")]))
plot(adxEVN$ADX,type = 'l')
adxFPH <- data.frame(ADX(FPH.AX[,c("FPH.AX.High","FPH.AX.Low","FPH.AX.Close")]))
plot(adxFPH$ADX,type = 'l')
adxFLT <- data.frame(ADX(FLT.AX[,c("FLT.AX.High","FLT.AX.Low","FLT.AX.Close")]))
plot(adxFLT$ADX,type = 'l')


adxGUD <- data.frame(ADX(GUD.AX[,c("GUD.AX.High","GUD.AX.Low","GUD.AX.Close")]))
plot(adxGUD$ADX,type = 'l')
adxGXY <- data.frame(ADX(GXY.AX[,c("GXY.AX.High","GXY.AX.Low","GXY.AX.Close")]))
plot(adxGXY$ADX,type = 'l')
adxGPT <- data.frame(ADX(GPT.AX[,c("GPT.AX.High","GPT.AX.Low","GPT.AX.Close")]))
plot(adxGPT$ADX,type = 'l')
adxGXL <- data.frame(ADX(GXL.AX[,c("GXL.AX.High","GXL.AX.Low","GXL.AX.Close")]))
plot(adxGXL$ADX,type = 'l')
adxGWA <- data.frame(ADX(GWA.AX[,c("GWA.AX.High","GWA.AX.Low","GWA.AX.Close")]))
plot(adxGWA$ADX,type = 'l')

adxIGO <- data.frame(ADX(IGO.AX[,c("IGO.AX.High","IGO.AX.Low","IGO.AX.Close")]))
plot(adxIGO$ADX,type = 'l')
adxIFL <- data.frame(ADX(IFL.AX[,c("IFL.AX.High","IFL.AX.Low","IFL.AX.Close")]))
plot(adxIFL$ADX,type = 'l')
adxIRE <- data.frame(ADX(IRE.AX[,c("IRE.AX.High","IRE.AX.Low","IRE.AX.Close")]))
plot(adxIRE$ADX,type = 'l')
adxJBH <- data.frame(ADX(JBH.AX[,c("JBH.AX.High","JBH.AX.Low","JBH.AX.Close")]))
plot(adxJBH$ADX,type = 'l')
adxJHX <- data.frame(ADX(JHX.AX[,c("JHX.AX.High","JHX.AX.Low","JHX.AX.Close")]))
plot(adxJHX$ADX,type = 'l')


#adxMFG <- data.frame(ADX(MFG.AX[,c("MFG.AX.High","MFG.AX.Low","MFG.AX.Close")]))
#plot(adxMFG$ADX,type = 'l')
#adxMIN <- data.frame(ADX(MIN.AX[,c("MIN.AX.High","MIN.AX.Low","MIN.AX.Close")]))
#plot(adxMIN$ADX,type = 'l')
adxMND <- data.frame(ADX(MND.AX[,c("MND.AX.High","MND.AX.Low","MND.AX.Close")]))
plot(adxMND$ADX,type = 'l')
adxMQG <- data.frame(ADX(MQG.AX[,c("MQG.AX.High","MQG.AX.Low","MQG.AX.Close")]))
plot(adxMQG$ADX,type = 'l')
adxNAB <- data.frame(ADX(NAB.AX[,c("NAB.AX.High","NAB.AX.Low","NAB.AX.Close")]))
plot(adxNAB$ADX,type = 'l')

adxNCM <- data.frame(ADX(NCM.AX[,c("NCM.AX.High","NCM.AX.Low","NCM.AX.Close")]))
plot(adxNCM$ADX,type = 'l')
adxNHF <- data.frame(ADX(NHF.AX[,c("NHF.AX.High","NHF.AX.Low","NHF.AX.Close")]))
plot(adxNHF$ADX,type = 'l')
adxNST <- data.frame(ADX(NST.AX[,c("NST.AX.High","NST.AX.Low","NST.AX.Close")]))
plot(adxNST$ADX,type = 'l')
adxNVT <- data.frame(ADX(NVT.AX[,c("NVT.AX.High","NVT.AX.Low","NVT.AX.Close")]))
plot(adxNVT$ADX,type = 'l')
adxORG <- data.frame(ADX(ORG.AX[,c("ORG.AX.High","ORG.AX.Low","ORG.AX.Close")]))
plot(adxORG$ADX,type = 'l')

adxOSH <- data.frame(ADX(OSH.AX[,c("OSH.AX.High","OSH.AX.Low","OSH.AX.Close")]))
plot(adxOSH$ADX,type = 'l')
adxPDL <- data.frame(ADX(PDL.AX[,c("PDL.AX.High","PDL.AX.Low","PDL.AX.Close")]))
plot(adxPDL$ADX,type = 'l')
adxPLS <- data.frame(ADX(PLS.AX[,c("PLS.AX.High","PLS.AX.Low","PLS.AX.Close")]))
plot(adxPLS$ADX,type = 'l')
adxPPT <- data.frame(ADX(PPT.AX[,c("PPT.AX.High","PPT.AX.Low","PPT.AX.Close")]))
plot(adxPPT$ADX,type = 'l')
adxPTM <- data.frame(ADX(PTM.AX[,c("PTM.AX.High","PTM.AX.Low","PTM.AX.Close")]))
plot(adxPTM$ADX,type = 'l')


adxQBE <- data.frame(ADX(QBE.AX[,c("QBE.AX.High","QBE.AX.Low","QBE.AX.Close")]))
plot(adxQBE$ADX,type = 'l')
adxREA <- data.frame(ADX(REA.AX[,c("REA.AX.High","REA.AX.Low","REA.AX.Close")]))
plot(adxREA$ADX,type = 'l')
adxRIO <- data.frame(ADX(RIO.AX[,c("RIO.AX.High","RIO.AX.Low","RIO.AX.Close")]))
plot(adxRIO$ADX,type = 'l')
#adxRRL <- data.frame(ADX(RRL.AX[,c("RRL.AX.High","RRL.AX.Low","RRL.AX.Close")]))
#plot(adxRRL$ADX,type = 'l')
adxSAR <- data.frame(ADX(SAR.AX[,c("SAR.AX.High","SAR.AX.Low","SAR.AX.Close")]))
plot(adxSAR$ADX,type = 'l')

adxSEK <- data.frame(ADX(SEK.AX[,c("SEK.AX.High","SEK.AX.Low","SEK.AX.Close")]))
plot(adxSEK$ADX,type = 'l')
adxSGM <- data.frame(ADX(SGM.AX[,c("SGM.AX.High","SGM.AX.Low","SGM.AX.Close")]))
plot(adxSGM$ADX,type = 'l')
adxSIG <- data.frame(ADX(SIG.AX[,c("SIG.AX.High","SIG.AX.Low","SIG.AX.Close")]))
plot(adxSIG$ADX,type = 'l')
adxSKC <- data.frame(ADX(SKC.AX[,c("SKC.AX.High","SKC.AX.Low","SKC.AX.Close")]))
plot(adxSKC$ADX,type = 'l')
adxSOL <- data.frame(ADX(SOL.AX[,c("SOL.AX.High","SOL.AX.Low","SOL.AX.Close")]))
plot(adxSOL$ADX,type = 'l')

#adxSRX <- data.frame(ADX(SRX.AX[,c("SRX.AX.High","SRX.AX.Low","SRX.AX.Close")]))
#plot(adxSRX$ADX,type = 'l')
adxSUL <- data.frame(ADX(SUL.AX[,c("SUL.AX.High","SUL.AX.Low","SUL.AX.Close")]))
plot(adxSUL$ADX,type = 'l')
adxSVW <- data.frame(ADX(SVW.AX[,c("SVW.AX.High","SVW.AX.Low","SVW.AX.Close")]))
plot(adxSVW$ADX,type = 'l')
adxSXL <- data.frame(ADX(SXL.AX[,c("SXL.AX.High","SXL.AX.Low","SXL.AX.Close")]))
plot(adxSXL$ADX,type = 'l')
adxSVW <- data.frame(ADX(SVW.AX[,c("SVW.AX.High","SVW.AX.Low","SVW.AX.Close")]))
plot(adxSVW$ADX,type = 'l')

adxSYR<- data.frame(ADX(SYR.AX[,c("SYR.AX.High","SYR.AX.Low","SYR.AX.Close")]))
plot(adxSYR$ADX,type = 'l')
adxTCL <- data.frame(ADX(TCL.AX[,c("TCL.AX.High","TCL.AX.Low","TCL.AX.Close")]))
plot(adxTCL$ADX,type = 'l')
adxTLS <- data.frame(ADX(TLS.AX[,c("TLS.AX.High","TLS.AX.Low","TLS.AX.Close")]))
plot(adxTLS$ADX,type = 'l')
adxTNE <- data.frame(ADX(TNE.AX[,c("TNE.AX.High","TNE.AX.Low","TNE.AX.Close")]))
plot(adxTNE$ADX,type = 'l')
adxWEB <- data.frame(ADX(WEB.AX[,c("WEB.AX.High","WEB.AX.Low","WEB.AX.Close")]))
plot(adxWEB$ADX,type = 'l')


adxWHC<- data.frame(ADX(WHC.AX[,c("WHC.AX.High","WHC.AX.Low","WHC.AX.Close")]))
plot(adxWHC$ADX,type = 'l')
adxWOW <- data.frame(ADX(WOW.AX[,c("WOW.AX.High","WOW.AX.Low","WOW.AX.Close")]))
plot(adxWOW$ADX,type = 'l')
adxWSA <- data.frame(ADX(WSA.AX[,c("WSA.AX.High","WSA.AX.Low","WSA.AX.Close")]))
plot(adxWSA$ADX,type = 'l')
adxABP <- data.frame(ADX(ABP.AX[,c("ABP.AX.High","ABP.AX.Low","ABP.AX.Close")]))
plot(adxABP$ADX,type = 'l')
adxALQ <- data.frame(ADX(ALQ.AX[,c("ALQ.AX.High","ALQ.AX.Low","ALQ.AX.Close")]))
plot(adxALQ$ADX,type = 'l')


adxAWC<- data.frame(ADX(AWC.AX[,c("AWC.AX.High","AWC.AX.Low","AWC.AX.Close")]))
plot(adxAWC$ADX,type = 'l')
adxAMP <- data.frame(ADX(AMP.AX[,c("AMP.AX.High","AMP.AX.Low","AMP.AX.Close")]))
plot(adxAMP$ADX,type = 'l')
adxANZ <- data.frame(ADX(ANZ.AX[,c("ANZ.AX.High","ANZ.AX.Low","ANZ.AX.Close")]))
plot(adxANZ$ADX,type = 'l')
adxARB <- data.frame(ADX(ARB.AX[,c("ARB.AX.High","ARB.AX.Low","ARB.AX.Close")]))
plot(adxARB$ADX,type = 'l')
adxALL <- data.frame(ADX(ALL.AX[,c("ALL.AX.High","ALL.AX.Low","ALL.AX.Close")]))
plot(adxALL$ADX,type = 'l')

adxASL<- data.frame(ADX(ASL.AX[,c("ASL.AX.High","ASL.AX.Low","ASL.AX.Close")]))
plot(adxASL$ADX,type = 'l')
adxAPI <- data.frame(ADX(API.AX[,c("API.AX.High","API.AX.Low","API.AX.Close")]))
plot(adxAPI$ADX,type = 'l')
adxAOG <- data.frame(ADX(AOG.AX[,c("AOG.AX.High","AOG.AX.Low","AOG.AX.Close")]))
plot(adxAOG$ADX,type = 'l')
adxBEN <- data.frame(ADX(BEN.AX[,c("BEN.AX.High","BEN.AX.Low","BEN.AX.Close")]))
plot(adxBEN$ADX,type = 'l')
adxBKL <- data.frame(ADX(BKL.AX[,c("BKL.AX.High","BKL.AX.Low","BKL.AX.Close")]))
plot(adxBKL$ADX,type = 'l')


adxBLD<- data.frame(ADX(BLD.AX[,c("BLD.AX.High","BLD.AX.Low","BLD.AX.Close")]))
plot(adxBLD$ADX,type = 'l')
adxBRG <- data.frame(ADX(BRG.AX[,c("BRG.AX.High","BRG.AX.Low","BRG.AX.Close")]))
plot(adxBRG$ADX,type = 'l')
adxBWP <- data.frame(ADX(BWP.AX[,c("BWP.AX.High","BWP.AX.Low","BWP.AX.Close")]))
plot(adxBWP$ADX,type = 'l')
adxCAR <- data.frame(ADX(CAR.AX[,c("CAR.AX.High","CAR.AX.Low","CAR.AX.Close")]))
plot(adxCAR$ADX,type = 'l')
adxCHC <- data.frame(ADX(CHC.AX[,c("CHC.AX.High","CHC.AX.Low","CHC.AX.Close")]))
plot(adxCHC$ADX,type = 'l')

adxBLD<- data.frame(ADX(BLD.AX[,c("BLD.AX.High","BLD.AX.Low","BLD.AX.Close")]))
plot(adxBLD$ADX,type = 'l')
adxBRG <- data.frame(ADX(BRG.AX[,c("BRG.AX.High","BRG.AX.Low","BRG.AX.Close")]))
plot(adxBRG$ADX,type = 'l')
adxBWP <- data.frame(ADX(BWP.AX[,c("BWP.AX.High","BWP.AX.Low","BWP.AX.Close")]))
plot(adxBWP$ADX,type = 'l')
adxCAR <- data.frame(ADX(CAR.AX[,c("CAR.AX.High","CAR.AX.Low","CAR.AX.Close")]))
plot(adxCAR$ADX,type = 'l')
adxCHC <- data.frame(ADX(CHC.AX[,c("CHC.AX.High","CHC.AX.Low","CHC.AX.Close")]))
plot(adxCHC$ADX,type = 'l')


adxCIM<- data.frame(ADX(CIM.AX[,c("CIM.AX.High","CIM.AX.Low","CIM.AX.Close")]))
plot(adxCIM$ADX,type = 'l')
adxCCL <- data.frame(ADX(CCL.AX[,c("CCL.AX.High","CCL.AX.Low","CCL.AX.Close")]))
plot(adxCCL$ADX,type = 'l')
adxCBA<- data.frame(ADX(CBA.AX[,c("CBA.AX.High","CBA.AX.Low","CBA.AX.Close")]))
plot(adxCBA$ADX,type = 'l')
adxCPP <- data.frame(ADX(CCP.AX[,c("CCP.AX.High","CCP.AX.Low","CCP.AX.Close")]))
plot(adxCPP$ADX,type = 'l')
adxCWN <- data.frame(ADX(CWN.AX[,c("CWN.AX.High","CWN.AX.Low","CWN.AX.Close")]))
plot(adxCWN$ADX,type = 'l')
adxCSR <- data.frame(ADX(CSR.AX[,c("CSR.AX.High","CSR.AX.Low","CSR.AX.Close")]))
plot(adxCSR$ADX,type = 'l')


adxCRM<- data.frame(ADX(CSR.AX[,c("CSR.AX.High","CSR.AX.Low","CSR.AX.Close")]))
plot(adxCRM$ADX,type = 'l')
adxDXS <- data.frame(ADX(DXS.AX[,c("DXS.AX.High","DXS.AX.Low","DXS.AX.Close")]))
plot(adxDXS$ADX,type = 'l')
adxFBU<- data.frame(ADX(FBU.AX[,c("FBU.AX.High","FBU.AX.Low","FBU.AX.Close")]))
plot(adxFBU$ADX,type = 'l')
adxFMG <- data.frame(ADX(FMG.AX[,c("FMG.AX.High","FMG.AX.Low","FMG.AX.Close")]))
plot(adxFMG$ADX,type = 'l')
adxGEM <- data.frame(ADX(GEM.AX[,c("GEM.AX.High","GEM.AX.Low","GEM.AX.Close")]))
plot(adxGEM$ADX,type = 'l')

adxGMG<- data.frame(ADX(GMG.AX[,c("GMG.AX.High","GMG.AX.Low","GMG.AX.Close")]))
plot(adxGMG$ADX,type = 'l')
adxGNC <- data.frame(ADX(GNC.AX[,c("GNC.AX.High","GNC.AX.Low","GNC.AX.Close")]))
plot(adxGNC$ADX,type = 'l')
adxGOZ<- data.frame(ADX(GOZ.AX[,c("GOZ.AX.High","GOZ.AX.Low","GOZ.AX.Close")]))
plot(adxGOZ$ADX,type = 'l')
adxHVN <- data.frame(ADX(HVN.AX[,c("HVN.AX.High","HVN.AX.Low","HVN.AX.Close")]))
plot(adxHVN$ADX,type = 'l')
adxIPL <- data.frame(ADX(IPL.AX[,c("IPL.AX.High","IPL.AX.Low","IPL.AX.Close")]))
plot(adxIPL$ADX,type = 'l')

adxIFN<- data.frame(ADX(IFN.AX[,c("IFN.AX.High","IFN.AX.Low","IFN.AX.Close")]))
plot(adxIFN$ADX,type = 'l')
adxIAG <- data.frame(ADX(IAG.AX[,c("IAG.AX.High","IAG.AX.Low","IAG.AX.Close")]))
plot(adxIAG$ADX,type = 'l')
adxIVC<- data.frame(ADX(IVC.AX[,c("IVC.AX.High","IVC.AX.Low","IVC.AX.Close")]))
plot(adxIVC$ADX,type = 'l')
adxHVN <- data.frame(ADX(HVN.AX[,c("HVN.AX.High","HVN.AX.Low","HVN.AX.Close")]))
plot(adxHVN$ADX,type = 'l')
adxJHG <- data.frame(ADX(JHG.AX[,c("JHG.AX.High","JHG.AX.Low","JHG.AX.Close")]))
plot(adxJHG$ADX,type = 'l')


adxLLC <- data.frame(ADX(LLC.AX[,c("LLC.AX.High","LLC.AX.Low","LLC.AX.Close")]))
plot(adxLLC$ADX,type = 'l')
adxLYC <- data.frame(ADX(LYC.AX[,c("LYC.AX.High","LYC.AX.Low","LYC.AX.Close")]))
plot(adxLYC$ADX,type = 'l')
adxMGR<- data.frame(ADX(MGR.AX[,c("MGR.AX.High","MGR.AX.Low","MGR.AX.Close")]))
plot(adxMGR$ADX,type = 'l')
adxMMS <- data.frame(ADX(MMS.AX[,c("MMS.AX.High","MMS.AX.Low","MMS.AX.Close")]))
plot(adxMMS$ADX,type = 'l')
adxMTS <- data.frame(ADX(MTS.AX[,c("MTS.AX.High","MTS.AX.Low","MTS.AX.Close")]))
plot(adxMTS$ADX,type = 'l')

adxMYX <- data.frame(ADX(MYX.AX[,c("MYX.AX.High","MYX.AX.Low","MYX.AX.Close")]))
plot(adxMYX$ADX,type = 'l')
adxNAN <- data.frame(ADX(NAN.AX[,c("NAN.AX.High","NAN.AX.Low","NAN.AX.Close")]))
plot(adxNAN$ADX,type = 'l')
adxNUF<- data.frame(ADX(NUF.AX[,c("NUF.AX.High","NUF.AX.Low","NUF.AX.Close")]))
plot(adxNUF$ADX,type = 'l')
adxORE <- data.frame(ADX(ORE.AX[,c("ORE.AX.High","ORE.AX.Low","ORE.AX.Close")]))
plot(adxORE$ADX,type = 'l')
adxORI <- data.frame(ADX(ORI.AX[,c("ORI.AX.High","ORI.AX.Low","ORI.AX.Close")]))
plot(adxORI$ADX,type = 'l')

adxOZL <- data.frame(ADX(OZL.AX[,c("OZL.AX.High","OZL.AX.Low","OZL.AX.Close")]))
plot(adxOZL$ADX,type = 'l')
adxPMV <- data.frame(ADX(PMV.AX[,c("PMV.AX.High","PMV.AX.Low","PMV.AX.Close")]))
plot(adxPMV$ADX,type = 'l')
adxPRY<- data.frame(ADX(PRY.AX[,c("PRY.AX.High","PRY.AX.Low","PRY.AX.Close")]))
plot(adxPRY$ADX,type = 'l')
adxQAN <- data.frame(ADX(QAN.AX[,c("QAN.AX.High","QAN.AX.Low","QAN.AX.Close")]))
plot(adxQAN$ADX,type = 'l')
adxQUB <- data.frame(ADX(QUB.AX[,c("QUB.AX.High","QUB.AX.Low","QUB.AX.Close")]))
plot(adxQUB$ADX,type = 'l')

adxRMD <- data.frame(ADX(RMD.AX[,c("RMD.AX.High","RMD.AX.Low","RMD.AX.Close")]))
plot(adxRMD$ADX,type = 'l')
adxRSG <- data.frame(ADX(RSG.AX[,c("RSG.AX.High","RSG.AX.Low","RSG.AX.Close")]))
plot(adxRSG$ADX,type = 'l')
adxSBM<- data.frame(ADX(SBM.AX[,c("SBM.AX.High","SBM.AX.Low","SBM.AX.Close")]))
plot(adxSBM$ADX,type = 'l')
adxSFR <- data.frame(ADX(SFR.AX[,c("SFR.AX.High","SFR.AX.Low","SFR.AX.Close")]))
plot(adxSFR$ADX,type = 'l')
adxSGP <- data.frame(ADX(SGP.AX[,c("SGP.AX.High","SGP.AX.Low","SGP.AX.Close")]))
plot(adxSGP$ADX,type = 'l')

adxSHL <- data.frame(ADX(SHL.AX[,c("SHL.AX.High","SHL.AX.Low","SHL.AX.Close")]))
plot(adxSHL$ADX,type = 'l')
adxSKI <- data.frame(ADX(SKI.AX[,c("SKI.AX.High","SKI.AX.Low","SKI.AX.Close")]))
plot(adxSKI$ADX,type = 'l')
adxSPK<- data.frame(ADX(SPK.AX[,c("SPK.AX.High","SPK.AX.Low","SPK.AX.Close")]))
plot(adxSPK$ADX,type = 'l')
adxSTO <- data.frame(ADX(STO.AX[,c("STO.AX.High","STO.AX.Low","STO.AX.Close")]))
plot(adxSTO$ADX,type = 'l')
adxSUN <- data.frame(ADX(SUN.AX[,c("SUN.AX.High","SUN.AX.Low","SUN.AX.Close")]))
plot(adxSUN$ADX,type = 'l')

adxSWM <- data.frame(ADX(SWM.AX[,c("SWM.AX.High","SWM.AX.Low","SWM.AX.Close")]))
plot(adxSWM$ADX,type = 'l')
adxSYD <- data.frame(ADX(SYD.AX[,c("SYD.AX.High","SYD.AX.Low","SYD.AX.Close")]))
plot(adxSYD$ADX,type = 'l')
adxSPK<- data.frame(ADX(SPK.AX[,c("SPK.AX.High","SPK.AX.Low","SPK.AX.Close")]))
plot(adxSPK$ADX,type = 'l')
adxTAH <- data.frame(ADX(TAH.AX[,c("TAH.AX.High","TAH.AX.Low","TAH.AX.Close")]))
plot(adxTAH$ADX,type = 'l')
adxSGP <- data.frame(ADX(SGP.AX[,c("SGP.AX.High","SGP.AX.Low","SGP.AX.Close")]))
plot(adxSGP$ADX,type = 'l')

adxTGR<- data.frame(ADX(TGR.AX[,c("TGR.AX.High","TGR.AX.Low","TGR.AX.Close")]))
plot(adxTGR$ADX,type = 'l')
adxVOC <- data.frame(ADX(VOC.AX[,c("VOC.AX.High","VOC.AX.Low","VOC.AX.Close")]))
plot(adxVOC$ADX,type = 'l')
adxWBC<- data.frame(ADX(WBC.AX[,c("WBC.AX.High","WBC.AX.Low","WBC.AX.Close")]))
plot(adxWBC$ADX,type = 'l')
adxWES <- data.frame(ADX(WES.AX[,c("WES.AX.High","WES.AX.Low","WES.AX.Close")]))
plot(adxWES$ADX,type = 'l')
adxWOR <- data.frame(ADX(WOR.AX[,c("WOR.AX.High","WOR.AX.Low","WOR.AX.Close")]))
plot(adxWOR$ADX,type = 'l')

adxWPL <- data.frame(ADX(WPL.AX[,c("WPL.AX.High","WPL.AX.Low","WPL.AX.Close")]))
plot(adxWPL$ADX,type = 'l')


#Parabolic Stop and Reversal Indicator
sarABC <- SAR(ABC.AX[,c("ABC.AX.High","ABC.AX.Low")], accel = c(0.02, 0.2))
trendABC=ABC.AX$ABC.AX.Low-sarABC
plot(trendABC)
sarAGL <- SAR(AGL.AX[,c("AGL.AX.High","AGL.AX.Low")], accel = c(0.02, 0.2))
trendAGL=AGL.AX$AGL.AX.Low-sarAGL
plot(trendAGL)
sarALU <- SAR(ALU.AX[,c("ALU.AX.High","ALU.AX.Low")], accel = c(0.02, 0.2))
trendALU=ALU.AX$ALU.AX.Low-sarALU
plot(trendALU)
sarANN <- SAR(ANN.AX[,c("ANN.AX.High","ANN.AX.Low")], accel = c(0.02, 0.2))
trendANN=ANN.AX$ANN.AX.Low-sarANN
plot(trendANN)
sarAPA <- SAR(APA.AX[,c("APA.AX.High","APA.AX.Low")], accel = c(0.02, 0.2))
trendAPA=APA.AX$APA.AX.Low-sarAPA
plot(trendAPA)


sarASX <- SAR(ASX.AX[,c("ASX.AX.High","ASX.AX.Low")], accel = c(0.02, 0.2))
trendASX=ASX.AX$ASX.AX.Low-sarASX
plot(trendASX)
sarAST <- SAR(AST.AX[,c("AST.AX.High","AST.AX.Low")], accel = c(0.02, 0.2))
trendAST=AST.AX$AST.AX.Low-sarAST
plot(trendAST)
sarAHG <- SAR(AHG.AX[,c("AHG.AX.High","AHG.AX.Low")], accel = c(0.02, 0.2))
trendAHG=AHG.AX$AHG.AX.Low-sarAHG
plot(trendAHG)
sarBOQ <- SAR(BOQ.AX[,c("BOQ.AX.High","BOQ.AX.Low")], accel = c(0.02, 0.2))
trendBOQ = BOQ.AX$BOQ.AX.Low-sarBOQ
plot(trendBOQ)
sarBPT <- SAR(BPT.AX[,c("BPT.AX.High","BPT.AX.Low")], accel = c(0.02, 0.2))
trendBPT=BPT.AX$BPT.AX.Low-sarBPT
plot(trendBPT)


sarBHP <- SAR(BHP.AX[,c("BHP.AX.High","BHP.AX.Low")], accel = c(0.02, 0.2))
trendBHP=BHP.AX$BHP.AX.Low-sarBHP
plot(trendBHP)
sarAST <- SAR(AST.AX[,c("AST.AX.High","AST.AX.Low")], accel = c(0.02, 0.2))
trendAST=AST.AX$AST.AX.Low-sarAST
plot(trendAST)
sarBSL <- SAR(BSL.AX[,c("BSL.AX.High","BSL.AX.Low")], accel = c(0.02, 0.2))
trendBSL=BSL.AX$BSL.AX.Low-sarBSL
plot(trendBSL)
sarBXB <- SAR(BXB.AX[,c("BXB.AX.High","BXB.AX.Low")], accel = c(0.02, 0.2))
trendBXB = BXB.AX$BXB.AX.Low-sarBXB
plot(trendBXB)
sarBKW <- SAR(BKW.AX[,c("BKW.AX.High","BKW.AX.Low")], accel = c(0.02, 0.2))
trendBKW=BKW.AX$BKW.AX.Low-sarBKW
plot(trendBKW)


sarCTX <- SAR(CTX.AX[,c("CTX.AX.High","CTX.AX.Low")], accel = c(0.02, 0.2))
trendCTX=CTX.AX$CTX.AX.Low-sarCTX
plot(trendCTX)
sarCGF <- SAR(CGF.AX[,c("CGF.AX.High","CGF.AX.Low")], accel = c(0.02, 0.2))
trendCGF=CGF.AX$CGF.AX.Low-sarCGF
plot(trendCGF)
sarCQR <- SAR(CQR.AX[,c("CQR.AX.High","CQR.AX.Low")], accel = c(0.02, 0.2))
trendCQR=CQR.AX$CQR.AX.Low-sarCQR
plot(trendCQR)
sarCWY <- SAR(CWY.AX[,c("CWY.AX.High","CWY.AX.Low")], accel = c(0.02, 0.2))
trendCWY = CWY.AX$CWY.AX.Low-sarCWY
plot(trendCWY)
sarCOH <- SAR(COH.AX[,c("COH.AX.High","COH.AX.Low")], accel = c(0.02, 0.2))
trendCOH=COH.AX$COH.AX.Low-sarCOH
plot(trendCOH)


sarCPU <- SAR(CPU.AX[,c("CPU.AX.High","CPU.AX.Low")], accel = c(0.02, 0.2))
trendCPU=CPU.AX$CPU.AX.Low-sarCPU
plot(trendCPU)
sarCMW <- SAR(CMW.AX[,c("CMW.AX.High","CMW.AX.Low")], accel = c(0.02, 0.2))
trendCMW=CMW.AX$CMW.AX.Low-sarCMW
plot(trendCMW)
sarCSL <- SAR(CSL.AX[,c("CSL.AX.High","CSL.AX.Low")], accel = c(0.02, 0.2))
trendCSL=CSL.AX$CSL.AX.Low-sarCSL
plot(trendCSL)
sarDOW <- SAR(DOW.AX[,c("DOW.AX.High","DOW.AX.Low")], accel = c(0.02, 0.2))
trendDOW=DOW.AX$DOW.AX.Low-sarDOW
plot(trendDOW)
sarEVN <- SAR(EVN.AX[,c("EVN.AX.High","EVN.AX.Low")], accel = c(0.02, 0.2))
trendEVN=EVN.AX$EVN.AX.Low-sarEVN
plot(trendEVN)


sarFPH <- SAR(FPH.AX[,c("FPH.AX.High","FPH.AX.Low")], accel = c(0.02, 0.2))
trendFPH=FPH.AX$FPH.AX.Low-sarFPH
plot(trendFPH)
sarFLT <- SAR(FLT.AX[,c("FLT.AX.High","FLT.AX.Low")], accel = c(0.02, 0.2))
trendFLT=FLT.AX$FLT.AX.Low-sarFLT
plot(trendFLT)
sarGUD <- SAR(GUD.AX[,c("GUD.AX.High","GUD.AX.Low")], accel = c(0.02, 0.2))
trendGUD=GUD.AX$GUD.AX.Low-sarGUD
plot(trendGUD)
sarGXY <- SAR(GXY.AX[,c("GXY.AX.High","GXY.AX.Low")], accel = c(0.02, 0.2))
trendGXY=GXY.AX$GXY.AX.Low-sarGXY
plot(trendGXY)
sarGPT <- SAR(GPT.AX[,c("GPT.AX.High","GPT.AX.Low")], accel = c(0.02, 0.2))
trendGPT=GPT.AX$GPT.AX.Low-sarGPT
plot(trendGPT)

sarGXL <- SAR(GXL.AX[,c("GXL.AX.High","GXL.AX.Low")], accel = c(0.02, 0.2))
trendGXL=GXL.AX$GXL.AX.Low-sarGXL
plot(trendGXL)
sarGWA <- SAR(GWA.AX[,c("GWA.AX.High","GWA.AX.Low")], accel = c(0.02, 0.2))
trendGWA=GWA.AX$GWA.AX.Low-sarGWA
plot(trendGWA)
sarILU <- SAR(ILU.AX[,c("ILU.AX.High","ILU.AX.Low")], accel = c(0.02, 0.2))
trendILU=ILU.AX$ILU.AX.Low-sarILU
plot(trendILU)
sarIGO <- SAR(IGO.AX[,c("IGO.AX.High","IGO.AX.Low")], accel = c(0.02, 0.2))
trendIGO=IGO.AX$IGO.AX.Low-sarIGO
plot(trendIGO)
sarIFL <- SAR(IFL.AX[,c("IFL.AX.High","IFL.AX.Low")], accel = c(0.02, 0.2))
trendIFL=IFL.AX$IFL.AX.Low-sarIFL
plot(trendIFL)

sarIRE <- SAR(IRE.AX[,c("IRE.AX.High","IRE.AX.Low")], accel = c(0.02, 0.2))
trendIRE=IRE.AX$IRE.AX.Low-sarIRE
plot(trendIRE)
sarJBH <- SAR(JBH.AX[,c("JBH.AX.High","JBH.AX.Low")], accel = c(0.02, 0.2))
trendJBH=JBH.AX$JBH.AX.Low-sarJBH
plot(trendJBH)
sarJHX <- SAR(JHX.AX[,c("JHX.AX.High","JHX.AX.Low")], accel = c(0.02, 0.2))
trendJHX=JHX.AX$JHX.AX.Low-sarJHX
plot(trendJHX)
#sarMFG <- SAR(MFG.AX[,c("MFG.AX.High","MFG.AX.Low")], accel = c(0.02, 0.2))
#trendMFG=MFG.AX$MFG.AX.Low-sarMFG
#plot(trendMFG)
#sarMIN <- SAR(MIN.AX[,c("MIN.AX.High","MIN.AX.Low")], accel = c(0.02, 0.2))
#trendMIN=MIN.AX$MIN.AX.Low-sarMIN
#plot(trendMIN)


sarMND <- SAR(MND.AX[,c("MND.AX.High","MND.AX.Low")], accel = c(0.02, 0.2))
trendMND=MND.AX$MND.AX.Low-sarMND
plot(trendMND)
sarMQG <- SAR(MQG.AX[,c("MQG.AX.High","MQG.AX.Low")], accel = c(0.02, 0.2))
trendMQG=MQG.AX$MQG.AX.Low-sarMQG
plot(trendMQG)
sarNAB <- SAR(NAB.AX[,c("NAB.AX.High","NAB.AX.Low")], accel = c(0.02, 0.2))
trendNAB=NAB.AX$NAB.AX.Low-sarNAB
plot(trendNAB)
sarNCM <- SAR(NCM.AX[,c("NCM.AX.High","NCM.AX.Low")], accel = c(0.02, 0.2))
trendNCM=NCM.AX$NCM.AX.Low-sarNCM
plot(trendNCM)
sarNHF <- SAR(NHF.AX[,c("NHF.AX.High","NHF.AX.Low")], accel = c(0.02, 0.2))
trendNHF=NHF.AX$NHF.AX.Low-sarNHF
plot(trendNHF)

sarNST <- SAR(NST.AX[,c("NST.AX.High","NST.AX.Low")], accel = c(0.02, 0.2))
trendNST=NST.AX$NST.AX.Low-sarNST
plot(trendNST)
sarNVT <- SAR(NVT.AX[,c("NVT.AX.High","NVT.AX.Low")], accel = c(0.02, 0.2))
trendNVT=NVT.AX$NVT.AX.Low-sarNVT
plot(trendNVT)
sarORG <- SAR(ORG.AX[,c("ORG.AX.High","ORG.AX.Low")], accel = c(0.02, 0.2))
trendORG=ORG.AX$ORG.AX.Low-sarORG
plot(trendORG)
sarOSH <- SAR(OSH.AX[,c("OSH.AX.High","OSH.AX.Low")], accel = c(0.02, 0.2))
trendOSH=OSH.AX$OSH.AX.Low-sarOSH
plot(trendOSH)
sarPDL <- SAR(PDL.AX[,c("PDL.AX.High","PDL.AX.Low")], accel = c(0.02, 0.2))
trendPDL=PDL.AX$PDL.AX.Low-sarPDL
plot(trendPDL)

sarPLS <- SAR(PLS.AX[,c("PLS.AX.High","PLS.AX.Low")], accel = c(0.02, 0.2))
trendPLS=PLS.AX$PLS.AX.Low-sarPLS
plot(trendPLS)
sarPPT <- SAR(PPT.AX[,c("PPT.AX.High","PPT.AX.Low")], accel = c(0.02, 0.2))
trendPPT=PPT.AX$PPT.AX.Low-sarPPT
plot(trendPPT)
sarPTM <- SAR(PTM.AX[,c("PTM.AX.High","PTM.AX.Low")], accel = c(0.02, 0.2))
trendPTM=PTM.AX$PTM.AX.Low-sarPTM
plot(trendPTM)
sarQBE <- SAR(QBE.AX[,c("QBE.AX.High","QBE.AX.Low")], accel = c(0.02, 0.2))
trendQBE=QBE.AX$QBE.AX.Low-sarQBE
plot(trendQBE)
sarREA <- SAR(REA.AX[,c("REA.AX.High","REA.AX.Low")], accel = c(0.02, 0.2))
trendREA=REA.AX$REA.AX.Low-sarREA
plot(trendREA)


sarRIO <- SAR(RIO.AX[,c("RIO.AX.High","RIO.AX.Low")], accel = c(0.02, 0.2))
trendRIO=RIO.AX$RIO.AX.Low-sarRIO
plot(trendRIO)
#sarRRL <- SAR(RRL.AX[,c("RRL.AX.High","RRL.AX.Low")], accel = c(0.02, 0.2))
#trendRRL=RRL.AX$RRL.AX.Low-sarRRL
#plot(trendRRL)
sarSAR <- SAR(SAR.AX[,c("SAR.AX.High","SAR.AX.Low")], accel = c(0.02, 0.2))
trendSAR=SAR.AX$SAR.AX.Low-sarSAR
plot(trendSAR)
sarSEK <- SAR(SEK.AX[,c("SEK.AX.High","SEK.AX.Low")], accel = c(0.02, 0.2))
trendSEK=SEK.AX$SEK.AX.Low-sarSEK
plot(trendSEK)
sarSGM <- SAR(SGM.AX[,c("SGM.AX.High","SGM.AX.Low")], accel = c(0.02, 0.2))
trendSGM=SGM.AX$SGM.AX.Low-sarSGM
plot(trendSGM)


#sarSIG <- SAR(SIG.AX[,c("SIG.AX.High","SIG.AX.Low")], accel = c(0.02, 0.2))
#trendSIG=SIG.AX$SIG.AX.Low-sarSIG
#plot(trendSGM)
sarSKC <- SAR(SKC.AX[,c("SKC.AX.High","SKC.AX.Low")], accel = c(0.02, 0.2))
trendSKC=SKC.AX$SKC.AX.Low-sarSKC
plot(trendSKC)
sarSOL <- SAR(SOL.AX[,c("SOL.AX.High","SOL.AX.Low")], accel = c(0.02, 0.2))
trendSOL=SOL.AX$SOL.AX.Low-sarSOL
plot(trendSOL)
#sarSRX <- SAR(SRX.AX[,c("SRX.AX.High","SRX.AX.Low")], accel = c(0.02, 0.2))
#trendSRX=SRX.AX$SRX.AX.Low-sarSRX
#plot(trendSRX)
sarSUL <- SAR(SUL.AX[,c("SUL.AX.High","SUL.AX.Low")], accel = c(0.02, 0.2))
trendSUL=SUL.AX$SUL.AX.Low-sarSUL
plot(trendSUL)
sarSVW <- SAR(SVW.AX[,c("SVW.AX.High","SVW.AX.Low")], accel = c(0.02, 0.2))
trendSVW=SVW.AX$SVW.AX.Low-sarSVW
plot(trendSVW)

sarSXL <- SAR(SXL.AX[,c("SXL.AX.High","SXL.AX.Low")], accel = c(0.02, 0.2))
trendSXL=SXL.AX$SXL.AX.Low-sarSXL
plot(trendSXL)
sarSYR <- SAR(SYR.AX[,c("SYR.AX.High","SYR.AX.Low")], accel = c(0.02, 0.2))
trendSYR=SYR.AX$SYR.AX.Low-sarSYR
plot(trendSYR)
sarTCL <- SAR(TCL.AX[,c("TCL.AX.High","TCL.AX.Low")], accel = c(0.02, 0.2))
trendTCL=TCL.AX$TCL.AX.Low-sarTCL
plot(trendTCL)
sarTLS <- SAR(TLS.AX[,c("TLS.AX.High","TLS.AX.Low")], accel = c(0.02, 0.2))
trendTLS=TLS.AX$TLS.AX.Low-sarTLS
plot(trendTLS)
sarTNE <- SAR(TNE.AX[,c("TNE.AX.High","TNE.AX.Low")], accel = c(0.02, 0.2))
trendTNE=TNE.AX$TNE.AX.Low-sarTNE
plot(trendTNE)

sarWEB <- SAR(WEB.AX[,c("WEB.AX.High","WEB.AX.Low")], accel = c(0.02, 0.2))
trendWEB=WEB.AX$WEB.AX.Low-sarWEB
plot(trendWEB)
sarWHC <- SAR(WHC.AX[,c("WHC.AX.High","WHC.AX.Low")], accel = c(0.02, 0.2))
trendWHC=WHC.AX$WHC.AX.Low-sarWHC
plot(trendWHC)
sarWOW <- SAR(WOW.AX[,c("WOW.AX.High","WOW.AX.Low")], accel = c(0.02, 0.2))
trendWOW=WOW.AX$WOW.AX.Low-sarWOW
plot(trendWOW)
sarWSA <- SAR(WSA.AX[,c("WSA.AX.High","WSA.AX.Low")], accel = c(0.02, 0.2))
trendWSA=WSA.AX$WSA.AX.Low-sarWSA
plot(trendWSA)
sarABP <- SAR(ABP.AX[,c("ABP.AX.High","ABP.AX.Low")], accel = c(0.02, 0.2))
trendABP=ABP.AX$ABP.AX.Low-sarABP
plot(trendABP)


sarALQ <- SAR(ALQ.AX[,c("ALQ.AX.High","ALQ.AX.Low")], accel = c(0.02, 0.2))
trendALQ=ALQ.AX$ALQ.AX.Low-sarALQ
plot(trendALQ)
sarAWC <- SAR(AWC.AX[,c("AWC.AX.High","AWC.AX.Low")], accel = c(0.02, 0.2))
trendAWC=AWC.AX$AWC.AX.Low-sarAWC
plot(trendAWC)
sarAMP <- SAR(AMP.AX[,c("AMP.AX.High","AMP.AX.Low")], accel = c(0.02, 0.2))
trendAMP=AMP.AX$AMP.AX.Low-sarAMP
plot(trendAMP)
sarANZ <- SAR(ANZ.AX[,c("ANZ.AX.High","ANZ.AX.Low")], accel = c(0.02, 0.2))
trendANZ=ANZ.AX$ANZ.AX.Low-sarANZ
plot(trendANZ)
sarARB <- SAR(ARB.AX[,c("ARB.AX.High","ARB.AX.Low")], accel = c(0.02, 0.2))
trendARB=ARB.AX$ARB.AX.Low-sarARB
plot(trendARB)

sarALL <- SAR(ALL.AX[,c("ALL.AX.High","ALL.AX.Low")], accel = c(0.02, 0.2))
trendALL=ALL.AX$ALL.AX.Low-sarALL
plot(trendALL)
sarASL <- SAR(ASL.AX[,c("ASL.AX.High","ASL.AX.Low")], accel = c(0.02, 0.2))
trendASL=ASL.AX$ASL.AX.Low-sarASL
plot(trendASL)
sarAPI <- SAR(API.AX[,c("API.AX.High","API.AX.Low")], accel = c(0.02, 0.2))
trendAPI=API.AX$API.AX.Low-sarAPI
plot(trendAPI)
sarAOG <- SAR(AOG.AX[,c("AOG.AX.High","AOG.AX.Low")], accel = c(0.02, 0.2))
trendAOG=AOG.AX$AOG.AX.Low-sarAOG
plot(trendAOG)
sarAOG <- SAR(AOG.AX[,c("AOG.AX.High","AOG.AX.Low")], accel = c(0.02, 0.2))
trendAOG=AOG.AX$AOG.AX.Low-sarAOG
plot(trendAOG)

sarBEN <- SAR(BEN.AX[,c("BEN.AX.High","BEN.AX.Low")], accel = c(0.02, 0.2))
trendBEN=BEN.AX$BEN.AX.Low-sarBEN
plot(trendBEN)
sarBKL <- SAR(BKL.AX[,c("BKL.AX.High","BKL.AX.Low")], accel = c(0.02, 0.2))
trendBKL=BKL.AX$BKL.AX.Low-sarBKL
plot(trendBKL)
sarBLD <- SAR(BLD.AX[,c("BLD.AX.High","BLD.AX.Low")], accel = c(0.02, 0.2))
trendBLD=BLD.AX$BLD.AX.Low-sarBLD
plot(trendBLD)
sarBRG <- SAR(BRG.AX[,c("BRG.AX.High","BRG.AX.Low")], accel = c(0.02, 0.2))
trendBRG=BRG.AX$BRG.AX.Low-sarBRG
plot(trendBRG)
sarBWP <- SAR(BWP.AX[,c("BWP.AX.High","BWP.AX.Low")], accel = c(0.02, 0.2))
trendBWP=BWP.AX$BWP.AX.Low-sarBWP
plot(trendBWP)

sarCAR <- SAR(CAR.AX[,c("CAR.AX.High","CAR.AX.Low")], accel = c(0.02, 0.2))
trendCAR=CAR.AX$CAR.AX.Low-sarCAR
plot(trendCAR)
sarCHC <- SAR(CHC.AX[,c("CHC.AX.High","CHC.AX.Low")], accel = c(0.02, 0.2))
trendCHC=CHC.AX$CHC.AX.Low-sarCHC
plot(trendCHC)
sarCIM <- SAR(CIM.AX[,c("CIM.AX.High","CIM.AX.Low")], accel = c(0.02, 0.2))
trendCIM=CIM.AX$CIM.AX.Low-sarCIM
plot(trendCIM)
sarCCL <- SAR(CCL.AX[,c("CCL.AX.High","CCL.AX.Low")], accel = c(0.02, 0.2))
trendCCL=CCL.AX$CCL.AX.Low-sarCCL
plot(trendCCL)
sarCBA <- SAR(CBA.AX[,c("CBA.AX.High","CBA.AX.Low")], accel = c(0.02, 0.2))
trendCBA=CBA.AX$CBA.AX.Low-sarCBA
plot(trendCBA)


sarCCP <- SAR(CCP.AX[,c("CCP.AX.High","CCP.AX.Low")], accel = c(0.02, 0.2))
trendCCP=CCP.AX$CCP.AX.Low-sarCCP
plot(trendCCP)
sarCWN <- SAR(CWN.AX[,c("CWN.AX.High","CWN.AX.Low")], accel = c(0.02, 0.2))
trendCWN=CWN.AX$CWN.AX.Low-sarCWN
plot(trendCWN)
sarCSR <- SAR(CSR.AX[,c("CSR.AX.High","CSR.AX.Low")], accel = c(0.02, 0.2))
trendCSR=CSR.AX$CSR.AX.Low-sarCSR
plot(trendCSR)
sarDXS <- SAR(DXS.AX[,c("DXS.AX.High","DXS.AX.Low")], accel = c(0.02, 0.2))
trendDXS=DXS.AX$DXS.AX.Low-sarDXS
plot(trendDXS)
sarFBU <- SAR(FBU.AX[,c("FBU.AX.High","FBU.AX.Low")], accel = c(0.02, 0.2))
trendFBU=FBU.AX$FBU.AX.Low-sarFBU
plot(trendFBU)


sarFMG <- SAR(FMG.AX[,c("FMG.AX.High","FMG.AX.Low")], accel = c(0.02, 0.2))
trendFMG=FMG.AX$FMG.AX.Low-sarFMG
plot(trendFMG)
sarGEM <- SAR(GEM.AX[,c("GEM.AX.High","GEM.AX.Low")], accel = c(0.02, 0.2))
trendGEM=GEM.AX$GEM.AX.Low-sarGEM
plot(trendGEM)
sarGMG <- SAR(GMG.AX[,c("GMG.AX.High","GMG.AX.Low")], accel = c(0.02, 0.2))
trendGMG=GMG.AX$GMG.AX.Low-sarGMG
plot(trendGMG)
sarGNC <- SAR(GNC.AX[,c("GNC.AX.High","GNC.AX.Low")], accel = c(0.02, 0.2))
trendGNC=GNC.AX$GNC.AX.Low-sarGNC
plot(trendGNC)
sarGOZ <- SAR(GOZ.AX[,c("GOZ.AX.High","GOZ.AX.Low")], accel = c(0.02, 0.2))
trendGOZ=GOZ.AX$GOZ.AX.Low-sarGOZ
plot(trendGOZ)

sarHVN <- SAR(HVN.AX[,c("HVN.AX.High","HVN.AX.Low")], accel = c(0.02, 0.2))
trendHVN=HVN.AX$HVN.AX.Low-sarHVN
plot(trendHVN)
sarIPL <- SAR(IPL.AX[,c("IPL.AX.High","IPL.AX.Low")], accel = c(0.02, 0.2))
trendIPL=IPL.AX$IPL.AX.Low-sarIPL
plot(trendIPL)
sarIFN <- SAR(IFN.AX[,c("IFN.AX.High","IFN.AX.Low")], accel = c(0.02, 0.2))
trendIFN=IFN.AX$IFN.AX.Low-sarIFN
plot(trendIFN)
sarIAG <- SAR(IAG.AX[,c("IAG.AX.High","IAG.AX.Low")], accel = c(0.02, 0.2))
trendIAG=IAG.AX$IAG.AX.Low-sarIAG
plot(trendIAG)
sarIVC <- SAR(IVC.AX[,c("IVC.AX.High","IVC.AX.Low")], accel = c(0.02, 0.2))
trendIVC=IVC.AX$IVC.AX.Low-sarIVC
plot(trendIVC)

sarJHG <- SAR(JHG.AX[,c("JHG.AX.High","JHG.AX.Low")], accel = c(0.02, 0.2))
trendJHG=JHG.AX$JHG.AX.Low-sarJHG
plot(trendJHG)
sarLLC <- SAR(LLC.AX[,c("LLC.AX.High","LLC.AX.Low")], accel = c(0.02, 0.2))
trendLLC=LLC.AX$LLC.AX.Low-sarLLC
plot(trendLLC)
sarLYC <- SAR(LYC.AX[,c("LYC.AX.High","LYC.AX.Low")], accel = c(0.02, 0.2))
trendLYC=LYC.AX$LYC.AX.Low-sarLYC
plot(trendLYC)
sarMGR <- SAR(MGR.AX[,c("MGR.AX.High","MGR.AX.Low")], accel = c(0.02, 0.2))
trendMGR=MGR.AX$MGR.AX.Low-sarMGR
plot(trendMGR)
sarMMS <- SAR(MMS.AX[,c("MMS.AX.High","MMS.AX.Low")], accel = c(0.02, 0.2))
trendMMS=MMS.AX$MMS.AX.Low-sarMMS
plot(trendMMS)


sarMTS <- SAR(MTS.AX[,c("MTS.AX.High","MTS.AX.Low")], accel = c(0.02, 0.2))
trendMTS=MTS.AX$MTS.AX.Low-sarMTS
plot(trendMYX)
sarMYX <- SAR(MYX.AX[,c("MYX.AX.High","MYX.AX.Low")], accel = c(0.02, 0.2))
trendMYX=MYX.AX$MYX.AX.Low-sarMYX
plot(trendMYX)
sarNAN <- SAR(NAN.AX[,c("NAN.AX.High","NAN.AX.Low")], accel = c(0.02, 0.2))
trendNAN=NAN.AX$NAN.AX.Low-sarNAN
plot(trendNAN)
sarNUF <- SAR(NUF.AX[,c("NUF.AX.High","NUF.AX.Low")], accel = c(0.02, 0.2))
trendNUF=NUF.AX$NUF.AX.Low-sarNUF
plot(trendNUF)
sarORE <- SAR(ORE.AX[,c("ORE.AX.High","ORE.AX.Low")], accel = c(0.02, 0.2))
trendORE=ORE.AX$ORE.AX.Low-sarORE
plot(trendORE)

sarORI <- SAR(ORI.AX[,c("ORI.AX.High","ORI.AX.Low")], accel = c(0.02, 0.2))
trendORI=ORI.AX$ORI.AX.Low-sarORI
plot(trendORI)
sarOZL <- SAR(OZL.AX[,c("OZL.AX.High","OZL.AX.Low")], accel = c(0.02, 0.2))
trendOZL=OZL.AX$OZL.AX.Low-sarOZL
plot(trendOZL)
sarPMV <- SAR(PMV.AX[,c("PMV.AX.High","PMV.AX.Low")], accel = c(0.02, 0.2))
trendPMV=PMV.AX$PMV.AX.Low-sarPMV
plot(trendPMV)
sarPRY <- SAR(PRY.AX[,c("PRY.AX.High","PRY.AX.Low")], accel = c(0.02, 0.2))
trendPRY=PRY.AX$PRY.AX.Low-sarPRY
plot(trendPRY)
sarQAN <- SAR(QAN.AX[,c("QAN.AX.High","QAN.AX.Low")], accel = c(0.02, 0.2))
trendQAN=QAN.AX$QAN.AX.Low-sarQAN
plot(trendQAN)

sarQUB <- SAR(QUB.AX[,c("QUB.AX.High","QUB.AX.Low")], accel = c(0.02, 0.2))
trendQUB=QUB.AX$QUB.AX.Low-sarQUB
plot(trendQUB)
sarRMD <- SAR(RMD.AX[,c("RMD.AX.High","RMD.AX.Low")], accel = c(0.02, 0.2))
trendRMD=RMD.AX$RMD.AX.Low-sarRMD
plot(trendRMD)
sarRSG <- SAR(RSG.AX[,c("RSG.AX.High","RSG.AX.Low")], accel = c(0.02, 0.2))
trendRSG=RSG.AX$RSG.AX.Low-sarRSG
plot(trendRSG)
sarSBM <- SAR(SBM.AX[,c("SBM.AX.High","SBM.AX.Low")], accel = c(0.02, 0.2))
trendSBM=SBM.AX$SBM.AX.Low-sarSBM
plot(trendSBM)
sarSFR <- SAR(SFR.AX[,c("SFR.AX.High","SFR.AX.Low")], accel = c(0.02, 0.2))
trendSFR=SFR.AX$SFR.AX.Low-sarSFR
plot(trendSFR)

sarSGP <- SAR(SGP.AX[,c("SGP.AX.High","SGP.AX.Low")], accel = c(0.02, 0.2))
trendSGP=SGP.AX$SGP.AX.Low-sarSGP
plot(trendSGP)
sarSHL <- SAR(SHL.AX[,c("SHL.AX.High","SHL.AX.Low")], accel = c(0.02, 0.2))
trendSHL=SHL.AX$SHL.AX.Low-sarSHL
plot(trendSHL)
sarSKI <- SAR(SKI.AX[,c("SKI.AX.High","SKI.AX.Low")], accel = c(0.02, 0.2))
trendSKI=SKI.AX$SKI.AX.Low-sarSKI
plot(trendSKI)
sarSPK <- SAR(SPK.AX[,c("SPK.AX.High","SPK.AX.Low")], accel = c(0.02, 0.2))
trendSPK=SPK.AX$SPK.AX.Low-sarSPK
plot(trendSPK)
sarSTO <- SAR(STO.AX[,c("STO.AX.High","STO.AX.Low")], accel = c(0.02, 0.2))
trendSTO=STO.AX$STO.AX.Low-sarSTO
plot(trendSTO)

sarSUN <- SAR(SUN.AX[,c("SUN.AX.High","SUN.AX.Low")], accel = c(0.02, 0.2))
trendSUN=SUN.AX$SUN.AX.Low-sarSUN
plot(trendSUN)
sarSWM <- SAR(SWM.AX[,c("SWM.AX.High","SWM.AX.Low")], accel = c(0.02, 0.2))
trendSWM=SWM.AX$SWM.AX.Low-sarSWM
plot(trendSWM)
sarSYD <- SAR(SYD.AX[,c("SYD.AX.High","SYD.AX.Low")], accel = c(0.02, 0.2))
trendSYD=SYD.AX$SYD.AX.Low-sarSYD
plot(trendSYD)
sarTAH <- SAR(TAH.AX[,c("TAH.AX.High","TAH.AX.Low")], accel = c(0.02, 0.2))
trendTAH=TAH.AX$TAH.AX.Low-sarTAH
plot(trendTAH)
sarSGP <- SAR(SGP.AX[,c("SGP.AX.High","SGP.AX.Low")], accel = c(0.02, 0.2))
trendSGP=SGP.AX$SGP.AX.Low-sarSGP
plot(trendSGP)

sarTGR <- SAR(TGR.AX[,c("TGR.AX.High","TGR.AX.Low")], accel = c(0.02, 0.2))
trendTGR=TGR.AX$TGR.AX.Low-sarTGR
plot(trendTGR)
sarVOC <- SAR(VOC.AX[,c("VOC.AX.High","VOC.AX.Low")], accel = c(0.02, 0.2))
trendVOC=VOC.AX$VOC.AX.Low-sarVOC
plot(trendVOC)
sarWBC <- SAR(WBC.AX[,c("WBC.AX.High","WBC.AX.Low")], accel = c(0.02, 0.2))
trendWBC=WBC.AX$WBC.AX.Low-sarWBC
plot(trendWBC)
sarWES <- SAR(WES.AX[,c("WES.AX.High","WES.AX.Low")], accel = c(0.02, 0.2))
trendWES=WES.AX$WES.AX.Low-sarWES
plot(trendWES)
sarWOR <- SAR(WOR.AX[,c("WOR.AX.High","WOR.AX.Low")], accel = c(0.02, 0.2))
trendWOR=WOR.AX$WOR.AX.Low-sarWOR
plot(trendWOR)

sarWPL <- SAR(WPL.AX[,c("WPL.AX.High","WPL.AX.Low")], accel = c(0.02, 0.2))
trendWPL=WPL.AX$WPL.AX.Low-sarWPL
plot(trendWPL)

#Induce a lag to avoid look ahead bias
rsiABC=c(NA,head(rsiABC,-1))
adxABC$ADX=c(NA,head(adxABC$ADX,-1))
trendABC=c(NA,head(trendABC,-1))

rsiAGL=c(NA,head(rsiAGL,-1))
adxAGL$ADX=c(NA,head(adxAGL$ADX,-1))
trendAGL=c(NA,head(trendAGL,-1))

rsiALU=c(NA,head(rsiALU,-1))
adxALU$ADX=c(NA,head(adxALU$ADX,-1))
trendALU=c(NA,head(trendALU,-1))

rsiANN=c(NA,head(rsiANN,-1))
adxANN$ADX=c(NA,head(adxANN$ADX,-1))
trendANN=c(NA,head(trendANN,-1))

rsiAPA=c(NA,head(rsiAPA,-1))
adxAPA$ADX=c(NA,head(adxAPA$ADX,-1))
trendAPA=c(NA,head(trendAPA,-1))

rsiASX=c(NA,head(rsiASX,-1))
adxASX$ADX=c(NA,head(adxASX$ADX,-1))
trendASX=c(NA,head(trendASX,-1))

rsiAST=c(NA,head(rsiAST,-1))
adxAST$ADX=c(NA,head(adxAST$ADX,-1))
trendAST=c(NA,head(trendAST,-1))

rsiAHG=c(NA,head(rsiAHG,-1))
adxAHG$ADX=c(NA,head(adxAHG$ADX,-1))
trendAHG=c(NA,head(trendAHG,-1))

rsiBOQ=c(NA,head(rsiBOQ,-1))
adxBOQ$ADX=c(NA,head(adxBOQ$ADX,-1))
trendBOQ=c(NA,head(trendBOQ,-1))

rsiBPT=c(NA,head(rsiBPT,-1))
adxBPT$ADX=c(NA,head(adxBPT$ADX,-1))
trendBPT=c(NA,head(trendBPT,-1))

rsiBHP=c(NA,head(rsiBHP,-1))
adxBHP$ADX=c(NA,head(adxBHP$ADX,-1))
trendBHP=c(NA,head(trendBHP,-1))

rsiBSL=c(NA,head(rsiBSL,-1))
adxBSL$ADX=c(NA,head(adxBSL$ADX,-1))
trendBSL=c(NA,head(trendBSL,-1))

rsiBXB=c(NA,head(rsiBXB,-1))
adxBXB$ADX=c(NA,head(adxBXB$ADX,-1))
trendBXB=c(NA,head(trendBXB,-1))

rsiBKW=c(NA,head(rsiBKW,-1))
adxBKW$ADX=c(NA,head(adxBKW$ADX,-1))
trendBKW=c(NA,head(trendBKW,-1))

rsiCTX=c(NA,head(rsiCTX,-1))
adxCTX$ADX=c(NA,head(adxCTX$ADX,-1))
trendCTX=c(NA,head(trendCTX,-1))

rsiCGF=c(NA,head(rsiCGF,-1))
adxCGF$ADX=c(NA,head(adxCGF$ADX,-1))
trendCGF=c(NA,head(trendCGF,-1))

rsiCQR=c(NA,head(rsiCQR,-1))
adxCQR$ADX=c(NA,head(adxCQR$ADX,-1))
trendCQR=c(NA,head(trendCQR,-1))

rsiCWY=c(NA,head(rsiCWY,-1))
adxCWY$ADX=c(NA,head(adxCWY$ADX,-1))
trendCWY=c(NA,head(trendCWY,-1))

rsiCOH=c(NA,head(rsiCOH,-1))
adxCOH$ADX=c(NA,head(adxCOH$ADX,-1))
trendCOH=c(NA,head(trendCOH,-1))

rsiCPU=c(NA,head(rsiCPU,-1))
adxCPU$ADX=c(NA,head(adxCPU$ADX,-1))
trendCPU=c(NA,head(trendCPU,-1))

rsiCMW=c(NA,head(rsiCMW,-1))
adxCMW$ADX=c(NA,head(adxCMW$ADX,-1))
trendCMW=c(NA,head(trendCMW,-1))

rsiCSL=c(NA,head(rsiCSL,-1))
adxCSL$ADX=c(NA,head(adxCSL$ADX,-1))
trendCSL=c(NA,head(trendCSL,-1))

rsiDOW=c(NA,head(rsiDOW,-1))
adxDOW$ADX=c(NA,head(adxDOW$ADX,-1))
trendDOW=c(NA,head(trendDOW,-1))

rsiEVN=c(NA,head(rsiEVN,-1))
adxEVN$ADX=c(NA,head(adxEVN$ADX,-1))
trendEVN=c(NA,head(trendEVN,-1))

rsiFPH=c(NA,head(rsiFPH,-1))
adxFPH$ADX=c(NA,head(adxFPH$ADX,-1))
trendFPH=c(NA,head(trendFPH,-1))

rsiFLT=c(NA,head(rsiFLT,-1))
adxFLT$ADX=c(NA,head(adxFLT$ADX,-1))
trendFLT=c(NA,head(trendFLT,-1))

rsiGUD=c(NA,head(rsiGUD,-1))
adxGUD$ADX=c(NA,head(adxGUD$ADX,-1))
trendGUD=c(NA,head(trendGUD,-1))

rsiGXY=c(NA,head(rsiGXY,-1))
adxGXY$ADX=c(NA,head(adxGXY$ADX,-1))
trendGXY=c(NA,head(trendGXY,-1))

rsiGPT=c(NA,head(rsiGPT,-1))
adxGPT$ADX=c(NA,head(adxGPT$ADX,-1))
trendGPT=c(NA,head(trendGPT,-1))

rsiGXL=c(NA,head(rsiGXL,-1))
adxGXL$ADX=c(NA,head(adxGXL$ADX,-1))
trendGXL=c(NA,head(trendGXL,-1))

rsiGWA=c(NA,head(rsiGWA,-1))
adxGWA$ADX=c(NA,head(adxGWA$ADX,-1))
trendGWA=c(NA,head(trendGWA,-1))

#rsiILU=c(NA,head(rsiILU,-1))
#adxILU$ADX=c(NA,head(adxILU$ADX,-1))
#trendILU=c(NA,head(trendILU,-1))

#rsiIGO=c(NA,head(rsiIGO,-1))
#adxIGO$ADX=c(NA,head(adxIGO$ADX,-1))
#trendIGO=c(NA,head(trendIGO,-1))

rsiIFL=c(NA,head(rsiIFL,-1))
adxIFL$ADX=c(NA,head(adxIFL$ADX,-1))
trendIFL=c(NA,head(trendIFL,-1))

rsiIRE=c(NA,head(rsiIRE,-1))
adxIRE$ADX=c(NA,head(adxIRE$ADX,-1))
trendIRE=c(NA,head(trendIRE,-1))

rsiJBH=c(NA,head(rsiJBH,-1))
adxJBH$ADX=c(NA,head(adxJBH$ADX,-1))
trendJBH=c(NA,head(trendJBH,-1))

rsiJHX=c(NA,head(rsiJHX,-1))
adxJHX$ADX=c(NA,head(adxJHX$ADX,-1))
trendJHX=c(NA,head(trendJHX,-1))

#rsiMFG=c(NA,head(rsiMFG,-1))
#adxMFG$ADX=c(NA,head(adxMFG$ADX,-1))
#trendMFG=c(NA,head(trendMFG,-1))

# rsiMIN=c(NA,head(rsiMIN,-1))
# adxMIN$ADX=c(NA,head(adxMIN$ADX,-1))
# trendMIN=c(NA,head(trendMIN,-1))

rsiMND=c(NA,head(rsiMND,-1))
adxMND$ADX=c(NA,head(adxMND$ADX,-1))
trendMND=c(NA,head(trendMND,-1))

rsiMQG=c(NA,head(rsiMQG,-1))
adxMQG$ADX=c(NA,head(adxMQG$ADX,-1))
trendMQG=c(NA,head(trendMQG,-1))

rsiNAB=c(NA,head(rsiNAB,-1))
adxNAB$ADX=c(NA,head(adxNAB$ADX,-1))
trendNAB=c(NA,head(trendNAB,-1))

rsiNCM=c(NA,head(rsiNCM,-1))
adxNCM$ADX=c(NA,head(adxNCM$ADX,-1))
trendNCM=c(NA,head(trendNCM,-1))

rsiNHF=c(NA,head(rsiNHF,-1))
adxNHF$ADX=c(NA,head(adxNHF$ADX,-1))
trendNHF=c(NA,head(trendNHF,-1))

rsiNST=c(NA,head(rsiNST,-1))
adxNST$ADX=c(NA,head(adxNST$ADX,-1))
trendNST=c(NA,head(trendNST,-1))

rsiNVT=c(NA,head(rsiNVT,-1))
adxNVT$ADX=c(NA,head(adxNVT$ADX,-1))
trendNVT=c(NA,head(trendNVT,-1))

rsiORG=c(NA,head(rsiORG,-1))
adxORG$ADX=c(NA,head(adxORG$ADX,-1))
trendORG=c(NA,head(trendORG,-1))

rsiOSH=c(NA,head(rsiOSH,-1))
adxOSH$ADX=c(NA,head(adxOSH$ADX,-1))
trendOSH=c(NA,head(trendOSH,-1))

rsiPDL=c(NA,head(rsiPDL,-1))
adxPDL$ADX=c(NA,head(adxPDL$ADX,-1))
trendPDL=c(NA,head(trendPDL,-1))

rsiPLS=c(NA,head(rsiPLS,-1))
adxPLS$ADX=c(NA,head(adxPLS$ADX,-1))
trendPLS=c(NA,head(trendPLS,-1))

rsiPPT=c(NA,head(rsiPPT,-1))
adxPPT$ADX=c(NA,head(adxPPT$ADX,-1))
trendPPT=c(NA,head(trendPPT,-1))

rsiPTM=c(NA,head(rsiPTM,-1))
adxPTM$ADX=c(NA,head(adxPTM$ADX,-1))
trendPTM=c(NA,head(trendPTM,-1))

rsiQBE=c(NA,head(rsiQBE,-1))
adxQBE$ADX=c(NA,head(adxQBE$ADX,-1))
trendQBE=c(NA,head(trendQBE,-1))

rsiREA=c(NA,head(rsiREA,-1))
adxREA$ADX=c(NA,head(adxREA$ADX,-1))
trendREA=c(NA,head(trendREA,-1))

rsiRIO=c(NA,head(rsiRIO,-1))
adxRIO$ADX=c(NA,head(adxRIO$ADX,-1))
trendRIO=c(NA,head(trendRIO,-1))

#rsiRRL=c(NA,head(rsiRRL,-1))
#adxRRL$ADX=c(NA,head(adxRRL$ADX,-1))
#trendRRL=c(NA,head(trendRRL,-1))

rsiSAR=c(NA,head(rsiSAR,-1))
adxSAR$ADX=c(NA,head(adxSAR$ADX,-1))
trendSAR=c(NA,head(trendSAR,-1))

rsiSEK=c(NA,head(rsiSEK,-1))
adxSEK$ADX=c(NA,head(adxSEK$ADX,-1))
trendSEK=c(NA,head(trendSEK,-1))

rsiSGM=c(NA,head(rsiSGM,-1))
adxSGM$ADX=c(NA,head(adxSGM$ADX,-1))
trendSGM=c(NA,head(trendSGM,-1))

rsiSIG=c(NA,head(rsiSIG,-1))
adxSIG$ADX=c(NA,head(adxSIG$ADX,-1))
trendSIG=c(NA,head(trendSIG,-1))

rsiSKC=c(NA,head(rsiSKC,-1))
adxSKC$ADX=c(NA,head(adxSKC$ADX,-1))
trendSKC=c(NA,head(trendSKC,-1))

#rsiSOL=c(NA,head(rsiSOL,-1))
#adxSOL$ADX=c(NA,head(adxSOL$ADX,-1))
#trendSOL=c(NA,head(trendSOL,-1))

#rsiSRX=c(NA,head(rsiSRX,-1))
#adxSRX$ADX=c(NA,head(adxSRX$ADX,-1))
#trendSRX=c(NA,head(trendSRX,-1))

rsiSUL=c(NA,head(rsiSUL,-1))
adxSUL$ADX=c(NA,head(adxSUL$ADX,-1))
trendSUL=c(NA,head(trendSUL,-1))

rsiSVW=c(NA,head(rsiSVW,-1))
adxSVW$ADX=c(NA,head(adxSVW$ADX,-1))
trendSVW=c(NA,head(trendSVW,-1))

rsiSXL=c(NA,head(rsiSXL,-1))
adxSXL$ADX=c(NA,head(adxSXL$ADX,-1))
trendSXL=c(NA,head(trendSXL,-1))

rsiSYR=c(NA,head(rsiSYR,-1))
adxSYR$ADX=c(NA,head(adxSYR$ADX,-1))
trendSYR=c(NA,head(trendSYR,-1))

#rsiTCL=c(NA,head(rsiTCL,-1))
#adxTCL$ADX=c(NA,head(adxTCL$ADX,-1))
#trendTCL=c(NA,head(trendTCL,-1))

rsiTLS=c(NA,head(rsiTLS,-1))
adxTLS$ADX=c(NA,head(adxTLS$ADX,-1))
trendTLS=c(NA,head(trendTLS,-1))

rsiTNE=c(NA,head(rsiTNE,-1))
adxTNE$ADX=c(NA,head(adxTNE$ADX,-1))
trendTNE=c(NA,head(trendTNE,-1))

rsiWEB=c(NA,head(rsiWEB,-1))
adxWEB$ADX=c(NA,head(adxWEB$ADX,-1))
trendWEB=c(NA,head(trendWEB,-1))

rsiWHC=c(NA,head(rsiWHC,-1))
adxWHC$ADX=c(NA,head(adxWHC$ADX,-1))
trendWHC=c(NA,head(trendWHC,-1))

rsiWOW=c(NA,head(rsiWOW,-1))
adxWOW$ADX=c(NA,head(adxWOW$ADX,-1))
trendWOW=c(NA,head(trendWOW,-1))

rsiWSA=c(NA,head(rsiWSA,-1))
adxWSA$ADX=c(NA,head(adxWSA$ADX,-1))
trendWSA=c(NA,head(trendWSA,-1))

rsiABP=c(NA,head(rsiABP,-1))
adxABP$ADX=c(NA,head(adxABP$ADX,-1))
trendABP=c(NA,head(trendABP,-1))

rsiALQ=c(NA,head(rsiALQ,-1))
adxALQ$ADX=c(NA,head(adxALQ$ADX,-1))
trendALQ=c(NA,head(trendALQ,-1))

rsiAWC=c(NA,head(rsiAWC,-1))
adxAWC$ADX=c(NA,head(adxAWC$ADX,-1))
trendAWC=c(NA,head(trendAWC,-1))

rsiAMP=c(NA,head(rsiAMP,-1))
adxAMP$ADX=c(NA,head(adxAMP$ADX,-1))
trendAMP=c(NA,head(trendAMP,-1))

rsiANZ=c(NA,head(rsiANZ,-1))
adxANZ$ADX=c(NA,head(adxANZ$ADX,-1))
trendANZ=c(NA,head(trendANZ,-1))

rsiARB=c(NA,head(rsiARB,-1))
adxARB$ADX=c(NA,head(adxARB$ADX,-1))
trendARB=c(NA,head(trendARB,-1))

rsiALL=c(NA,head(rsiALL,-1))
adxALL$ADX=c(NA,head(adxALL$ADX,-1))
trendALL=c(NA,head(trendALL,-1))

rsiASL=c(NA,head(rsiASL,-1))
adxASL$ADX=c(NA,head(adxASL$ADX,-1))
trendASL=c(NA,head(trendASL,-1))

rsiAPI=c(NA,head(rsiAPI,-1))
adxAPI$ADX=c(NA,head(adxAPI$ADX,-1))
trendAPI=c(NA,head(trendAPI,-1))

rsiAOG=c(NA,head(rsiAOG,-1))
adxAOG$ADX=c(NA,head(adxAOG$ADX,-1))
trendAOG=c(NA,head(trendAOG,-1))

rsiBEN=c(NA,head(rsiBEN,-1))
adxBEN$ADX=c(NA,head(adxBEN$ADX,-1))
trendBEN=c(NA,head(trendBEN,-1))

rsiBKL=c(NA,head(rsiBKL,-1))
adxBKL$ADX=c(NA,head(adxBKL$ADX,-1))
trendBKL=c(NA,head(trendBKL,-1))

rsiBLD=c(NA,head(rsiBLD,-1))
adxBLD$ADX=c(NA,head(adxBLD$ADX,-1))
trendBLD=c(NA,head(trendBLD,-1))

rsiBRG=c(NA,head(rsiBRG,-1))
adxBRG$ADX=c(NA,head(adxBRG$ADX,-1))
trendBRG=c(NA,head(trendBRG,-1))

rsiBWP=c(NA,head(rsiBWP,-1))
adxBWP$ADX=c(NA,head(adxBWP$ADX,-1))
trendBWP=c(NA,head(trendBWP,-1))

rsiCAR=c(NA,head(rsiCAR,-1))
adxCAR$ADX=c(NA,head(adxCAR$ADX,-1))
trendCAR=c(NA,head(trendCAR,-1))

rsiCHC=c(NA,head(rsiCHC,-1))
adxCHC$ADX=c(NA,head(adxCHC$ADX,-1))
trendCHC=c(NA,head(trendCHC,-1))

rsiCIM=c(NA,head(rsiCIM,-1))
adxCIM$ADX=c(NA,head(adxCIM$ADX,-1))
trendCIM=c(NA,head(trendCIM,-1))

rsiCCL=c(NA,head(rsiCCL,-1))
adxCCL$ADX=c(NA,head(adxCCL$ADX,-1))
trendCCL=c(NA,head(trendCCL,-1))

rsiCBA=c(NA,head(rsiCBA,-1))
adxCBA$ADX=c(NA,head(adxCBA$ADX,-1))
trendCBA=c(NA,head(trendCBA,-1))

#rsiCCP=c(NA,head(rsiCCP,-1))
#adxCCP$ADX=c(NA,head(adxCCP$ADX,-1))
#trendCCP=c(NA,head(trendCCP,-1))

rsiCWN=c(NA,head(rsiCWN,-1))
adxCWN$ADX=c(NA,head(adxCWN$ADX,-1))
trendCWN=c(NA,head(trendCWN,-1))

rsiCSR=c(NA,head(rsiCSR,-1))
adxCSR$ADX=c(NA,head(adxCSR$ADX,-1))
trendCSR=c(NA,head(trendCSR,-1))

rsiDXS=c(NA,head(rsiDXS,-1))
adxDXS$ADX=c(NA,head(adxDXS$ADX,-1))
trendDXS=c(NA,head(trendDXS,-1))

rsiFBU=c(NA,head(rsiFBU,-1))
adxFBU$ADX=c(NA,head(adxFBU$ADX,-1))
trendFBU=c(NA,head(trendFBU,-1))

rsiFMG=c(NA,head(rsiFMG,-1))
adxFMG$ADX=c(NA,head(adxFMG$ADX,-1))
trendFMG=c(NA,head(trendFMG,-1))

rsiGEM=c(NA,head(rsiGEM,-1))
adxGEM$ADX=c(NA,head(adxGEM$ADX,-1))
trendGEM=c(NA,head(trendGEM,-1))

rsiGMG=c(NA,head(rsiGMG,-1))
adxGMG$ADX=c(NA,head(adxGMG$ADX,-1))
trendGMG=c(NA,head(trendGMG,-1))

rsiGNC=c(NA,head(rsiGNC,-1))
adxGNC$ADX=c(NA,head(adxGNC$ADX,-1))
trendGNC=c(NA,head(trendGNC,-1))

rsiGOZ=c(NA,head(rsiGOZ,-1))
adxGOZ$ADX=c(NA,head(adxGOZ$ADX,-1))
trendGOZ=c(NA,head(trendGOZ,-1))

rsiHVN=c(NA,head(rsiHVN,-1))
adxHVN$ADX=c(NA,head(adxHVN$ADX,-1))
trendHVN=c(NA,head(trendHVN,-1))

rsiIPL=c(NA,head(rsiIPL,-1))
adxIPL$ADX=c(NA,head(adxIPL$ADX,-1))
trendIPL=c(NA,head(trendIPL,-1))

rsiIFN=c(NA,head(rsiIFN,-1))
adxIFN$ADX=c(NA,head(adxIFN$ADX,-1))
trendIFN=c(NA,head(trendIFN,-1))

rsiIAG=c(NA,head(rsiIAG,-1))
adxIAG$ADX=c(NA,head(adxIAG$ADX,-1))
trendIAG=c(NA,head(trendIAG,-1))

rsiIVC=c(NA,head(rsiIVC,-1))
adxIVC$ADX=c(NA,head(adxIVC$ADX,-1))
trendIVC=c(NA,head(trendIVC,-1))

rsiJHG=c(NA,head(rsiJHG,-1))
adxJHG$ADX=c(NA,head(adxJHG$ADX,-1))
trendJHG=c(NA,head(trendJHG,-1))

rsiLLC=c(NA,head(rsiLLC,-1))
adxLLC$ADX=c(NA,head(adxLLC$ADX,-1))
trendLLC=c(NA,head(trendLLC,-1))

rsiLYC=c(NA,head(rsiLYC,-1))
adxLYC$ADX=c(NA,head(adxLYC$ADX,-1))
trendLYC=c(NA,head(trendLYC,-1))

rsiMGR=c(NA,head(rsiMGR,-1))
adxMGR$ADX=c(NA,head(adxMGR$ADX,-1))
trendMGR=c(NA,head(trendMGR,-1))

rsiMMS=c(NA,head(rsiMMS,-1))
adxMMS$ADX=c(NA,head(adxMMS$ADX,-1))
trendMMS=c(NA,head(trendMMS,-1))

rsiMTS=c(NA,head(rsiMTS,-1))
adxMTS$ADX=c(NA,head(adxMTS$ADX,-1))
trendMTS=c(NA,head(trendMTS,-1))

rsiMYX=c(NA,head(rsiMYX,-1))
adxMYX$ADX=c(NA,head(adxMYX$ADX,-1))
trendMYX=c(NA,head(trendMYX,-1))

rsiNAN=c(NA,head(rsiNAN,-1))
adxNAN$ADX=c(NA,head(adxNAN$ADX,-1))
trendNAN=c(NA,head(trendNAN,-1))

rsiNUF=c(NA,head(rsiNUF,-1))
adxNUF$ADX=c(NA,head(adxNUF$ADX,-1))
trendNUF=c(NA,head(trendNUF,-1))

rsiORE=c(NA,head(rsiORE,-1))
adxORE$ADX=c(NA,head(adxORE$ADX,-1))
trendORE=c(NA,head(trendORE,-1))

rsiORI=c(NA,head(rsiORI,-1))
adxORI$ADX=c(NA,head(adxORI$ADX,-1))
trendORI=c(NA,head(trendORI,-1))

rsiOZL=c(NA,head(rsiOZL,-1))
adxOZL$ADX=c(NA,head(adxOZL$ADX,-1))
trendOZL=c(NA,head(trendOZL,-1))

rsiPMV=c(NA,head(rsiPMV,-1)) 
adxPMV$ADX=c(NA,head(adxPMV$ADX,-1))
trendPMV=c(NA,head(trendPMV,-1))

rsiPRY=c(NA,head(rsiPRY,-1))
adxPRY$ADX=c(NA,head(adxPRY$ADX,-1))
trendPRY=c(NA,head(trendPRY,-1))

rsiQAN=c(NA,head(rsiQAN,-1))
adxQAN$ADX=c(NA,head(adxQAN$ADX,-1))
trendQAN=c(NA,head(trendQAN,-1))

rsiQUB=c(NA,head(rsiQUB,-1))
adxQUB$ADX=c(NA,head(adxQUB$ADX,-1))
trendQUB=c(NA,head(trendQUB,-1))

rsiRMD=c(NA,head(rsiRMD,-1))
adxRMD$ADX=c(NA,head(adxRMD$ADX,-1))
trendRMD=c(NA,head(trendRMD,-1))

rsiRSG=c(NA,head(rsiRSG,-1))
adxRSG$ADX=c(NA,head(adxRSG$ADX,-1))
trendRSG=c(NA,head(trendRSG,-1))

rsiSBM=c(NA,head(rsiSBM,-1))
adxSBM$ADX=c(NA,head(adxSBM$ADX,-1))
trendSBM=c(NA,head(trendSBM,-1))

rsiSFR=c(NA,head(rsiSFR,-1))
adxSFR$ADX=c(NA,head(adxSFR$ADX,-1))
trendSFR=c(NA,head(trendSFR,-1))

rsiSGP=c(NA,head(rsiSGP,-1))
adxSGP$ADX=c(NA,head(adxSGP$ADX,-1))
trendSGP=c(NA,head(trendSGP,-1))

rsiSHL=c(NA,head(rsiSHL,-1))
adxSHL$ADX=c(NA,head(adxSHL$ADX,-1))
trendSHL=c(NA,head(trendSHL,-1))

rsiSKI=c(NA,head(rsiSKI,-1))
adxSKI$ADX=c(NA,head(adxSKI$ADX,-1))
trendSKI=c(NA,head(trendSKI,-1))

rsiSPK=c(NA,head(rsiSPK,-1))
adxSPK$ADX=c(NA,head(adxSPK$ADX,-1))
trendSPK=c(NA,head(trendSPK,-1))

rsiSTO=c(NA,head(rsiSTO,-1))
adxSTO$ADX=c(NA,head(adxSTO$ADX,-1))
trendSTO=c(NA,head(trendSTO,-1))

rsiSUN=c(NA,head(rsiSUN,-1))
adxSUN$ADX=c(NA,head(adxSUN$ADX,-1))
trendSUN=c(NA,head(trendSUN,-1))

rsiSWM=c(NA,head(rsiSWM,-1))
adxSWM$ADX=c(NA,head(adxSWM$ADX,-1))
trendSWM=c(NA,head(trendSWM,-1))

rsiSYD=c(NA,head(rsiSYD,-1))
adxSYD$ADX=c(NA,head(adxSYD$ADX,-1))
trendSYD=c(NA,head(trendSYD,-1))

rsiTAH=c(NA,head(rsiTAH,-1))
adxTAH$ADX=c(NA,head(adxTAH$ADX,-1))
trendTAH=c(NA,head(trendTAH,-1))

rsiSGP=c(NA,head(rsiSGP,-1))
adxSGP$ADX=c(NA,head(adxSGP$ADX,-1))
trendSGP=c(NA,head(trendSGP,-1))

rsiTGR=c(NA,head(rsiTGR,-1))
adxTGR$ADX=c(NA,head(adxTGR$ADX,-1))
trendTGR=c(NA,head(trendTGR,-1))

rsiVOC=c(NA,head(rsiVOC,-1))
adxVOC$ADX=c(NA,head(adxVOC$ADX,-1))
trendVOC=c(NA,head(trendVOC,-1))

rsiWBC=c(NA,head(rsiWBC,-1))
adxWBC$ADX=c(NA,head(adxWBC$ADX,-1))
trendWBC=c(NA,head(trendWBC,-1))

rsiWES=c(NA,head(rsiWES,-1))
adxWES$ADX=c(NA,head(adxWES$ADX,-1))
trendWES=c(NA,head(trendWES,-1))

rsiWOR=c(NA,head(rsiWOR,-1))
adxWOR$ADX=c(NA,head(adxWOR$ADX,-1))
trendWOR=c(NA,head(trendWOR,-1))

rsiWPL=c(NA,head(rsiWPL,-1))
adxWPL$ADX=c(NA,head(adxWPL$ADX,-1))
trendWPL=c(NA,head(trendWPL,-1))


#Objective is to predict up or down on the daily price
#A clear binary classification problem
#Create the response variable
price=ANZ.AX$ANZ.AX.Close>=ANZ.AX$ANZ.AX.Open
price=c(NA,head(price,-1))
class=ifelse(price > 0,1,0)


#Combine input features into a matrix
model_df = data.frame(class,rsiABC,rsiAGL,rsiALU
,rsiANN,rsiAPA,rsiASX,rsiAST,rsiAHG,rsiBOQ,rsiBPT,rsiBXB,rsiBKW,rsiBSL,rsiCTX,rsiCGF,rsiCQR,rsiCWY,rsiCOH,rsiCPU,rsiCMW,rsiCSL,rsiDOW,rsiEVN,rsiFPH,rsiFLT,rsiGUD,rsiGXY,rsiGPT,rsiGXL,rsiGWA,rsiGXY,rsiIFL,rsiIRE,rsiJBH,rsiJHX,rsiMND,rsiMQG,rsiNAB,rsiNCM,rsiNHF,rsiNST,rsiNVT,rsiORG,rsiOSH,rsiPDL,rsiPLS,rsiPDL,rsiPPT,rsiPTM,rsiQBE,rsiREA,rsiRIO,rsiSAR,rsiSEK,rsiSGM,rsiSIG,rsiSKC,rsiSUL,rsiSXL,rsiSVW,rsiSYR,rsiTLS,rsiTNE,rsiWEB,rsiWHC,rsiWOW,rsiWSA,rsiABP,rsiALQ,rsiAWC,rsiAMP,rsiANZ,rsiARB,rsiALL,rsiASL,rsiAPI,rsiAOG,rsiBEN,rsiBKL,rsiBLD,rsiBRG,rsiBWP,rsiCAR,rsiCHC,rsiCIM,rsiCCL,rsiCBA,rsiCCP,rsiCWN,rsiCSR,rsiDXS,rsiFBU,rsiFMG,rsiGEM,rsiGMG,rsiGNC,rsiGOZ,rsiHVN,rsiIPL,rsiIFN,rsiIAG,rsiIVC,rsiJHG,rsiLLC,rsiLYC,rsiIAG,rsiIVC,rsiMGR,rsiMMS,rsiMTS,rsiMYX,rsiNAN,rsiNUF,rsiORE,rsiORI,rsiOZL,rsiPRY,rsiQAN,rsiQUB,rsiRMD,rsiRSG,rsiSBM,rsiSFR,rsiSGP,rsiSHL,rsiSGP,rsiSKI,rsiSPK,rsiSTO,rsiSUN,rsiSWM,rsiSYD,rsiTAH,rsiTGR,rsiVOC,rsiWBC,rsiWES,rsiWOR,rsiWPL,adxABC$ADX,adxAGL$ADX,adxALU$ADX,adxANN$ADX,adxAPA$ADX,adxASX$ADX,adxAST$ADX,adxAHG$ADX,adxBOQ$ADX,adxBPT$ADX,adxBHP$ADX,adxBSL$ADX,adxBXB$ADX,adxBKW$ADX,adxCTX$ADX,adxCGF$ADX,adxCQR$ADX,adxCWY$ADX,adxCOH$ADX,adxCPU$ADX,adxCMW$ADX,adxCSL$ADX,adxDOW$ADX,adxEVN$ADX,adxFPH$ADX,adxFLT$ADX,adxGUD$ADX,adxGXY$ADX,adxGPT$ADX,adxGXL$ADX,adxGWA$ADX,adxIGO$ADX,adxIFL$ADX,adxIRE$ADX,adxJBH$ADX,adxJHX$ADX,adxMQG$ADX,adxNAB$ADX,adxNCM$ADX,adxNHF$ADX,adxNST$ADX,adxNVT$ADX,adxORG$ADX,adxOSH$ADX,adxPDL$ADX,adxPLS$ADX,adxPPT$ADX,adxQBE$ADX,adxREA$ADX,adxRIO$ADX,adxSEK$ADX,adxSGM$ADX,adxSIG$ADX,adxSKC$ADX,adxSOL$ADX,adxSUL$ADX,adxSVW$ADX,adxSXL$ADX,adxSVW$ADX,adxSYR$ADX,adxTCL$ADX,adxTLS$ADX,adxTNE$ADX,adxWEB$ADX,adxWHC$ADX,adxWOW$ADX,adxWSA$ADX,adxABP$ADX,adxALQ$ADX,adxAWC$ADX,adxAMP$ADX,adxANZ$ADX,adxARB$ADX,adxALL$ADX,adxASL$ADX,adxAPI$ADX,adxAOG$ADX,adxBEN$ADX,adxBKL$ADX,adxBLD$ADX,adxBRG$ADX,adxBWP$ADX,adxCAR$ADX,adxCHC$ADX,adxBLD$ADX,adxBRG$ADX,adxBWP$ADX,adxCAR$ADX,adxCHC$ADX,adxCIM$ADX,adxCCL$ADX,adxCBA$ADX,adxCPP$ADX,adxCWN$ADX,adxCSR$ADX,adxCRM$ADX,adxDXS$ADX,adxFBU$ADX,adxFMG$ADX,adxGEM$ADX,adxGMG$ADX,adxGNC$ADX,adxGOZ$ADX,adxHVN$ADX,adxIPL$ADX,adxIFN$ADX,adxIAG$ADX,adxIVC$ADX,adxHVN$ADX,adxJHG$ADX,adxLLC$ADX,adxLYC$ADX,adxMGR$ADX,adxMMS$ADX,adxMTS$ADX,adxMYX$ADX,adxNAN$ADX,adxNUF$ADX,adxORE$ADX,adxORI$ADX,adxOZL$ADX,adxPMV$ADX,adxPRY$ADX,adxQAN$ADX,adxQUB$ADX,adxRMD$ADX,adxRSG$ADX,adxSBM$ADX,adxSFR$ADX,adxSGP$ADX,adxSHL$ADX,adxSKI$ADX,adxSPK$ADX,adxSPK$ADX,adxSTO$ADX,adxSUN$ADX,adxSWM$ADX,adxSYD$ADX,adxSPK$ADX,adxTAH$ADX,adxSGP$ADX,adxTGR$ADX,adxVOC$ADX,adxWBC$ADX,adxWES$ADX,adxWOR$ADX,adxWPL$ADX,trendABC,trendAGL,trendALU,trendANN,trendAPA,trendASX,trendAST,trendAHG,trendBOQ,trendBPT,trendBHP,trendBSL,trendBXB,trendBKW,trendCTX,trendCGF,trendCQR,trendCWY,trendCOH,trendCPU,trendCMW,trendCSL,trendDOW,trendEVN,trendFPH,trendFLT,trendGUD,trendGXY,trendGPT,trendGXL,trendGWA,trendILU,trendIGO,trendIFL,trendIRE,trendJBH,trendJHX,trendMND,trendMQG,trendNAB,trendNCM,trendNHF,trendNST,trendNVT,trendORG,trendOSH,trendPDL,trendPLS,trendPPT,trendPTM,trendQBE,trendREA,trendRIO,trendSAR,trendSEK,trendSGM,trendSKC,trendSOL,trendSUL,trendSVW,trendSXL,trendSYR,trendTCL,trendTLS,trendTNE,trendWEB,trendWHC,trendWOW,trendWSA,trendABP,trendALQ,trendAWC,trendAMP,trendANZ,trendARB,trendALL,trendASL,trendAPI,trendAOG,trendBEN,trendBKL,trendBLD,trendBRG,trendBWP,trendCAR,trendCHC,trendCIM,trendCCL,trendCBA,trendCCP,trendCWN,trendCSR,trendDXS,trendFBU,trendFMG,trendGEM,trendGMG,trendGNC,trendGOZ,trendHVN,trendIPL,trendIFN,trendIAG,trendIVC,trendJHG,trendLLC,trendLYC,trendMGR,trendMMS,trendMTS,trendMYX,trendNAN,trendNUF,trendORE,trendORI,trendOZL,trendPMV,trendPRY,trendQAN,trendQUB,trendRMD,trendRSG,trendSBM,trendSFR,trendSGP,trendSHL,trendSKI,trendSPK,trendSTO,trendSUN,trendSWM,trendSYD,trendTAH,trendSGP,trendTGR,trendVOC,trendWBC,trendWES,trendWOR,trendWPL)

class(model_df)





#Data prep for training and test
train_sz=2/3
breakpt = nrow(model)*train_sz
traindata=model[1:breakpt,]
testdata=model[(breakpt+1):nrow(model),]
#Break train data into X and Y- Response Variable
X_train=traindata[,2:10]
Y_train=traindata[,1]
class(X_train)[1]
class(Y_train)
#Do the same for test data
X_test=testdata[,2:10]
Y_test=testdata[,1]
class(X_test)[1]
class(Y_test)
#Time to start XGBoost
set.seed(3213)
dtrain=xgb.DMatrix(data = X_train, label=Y_train)
xgmodel=xgboost(data=dtrain, nrounds = 40, nfold = 5, max_depth = 2, eta = 1, objective="binary:logistic")
#Use cross validation
dtrain=xgb.DMatrix(data = X_train, label=Y_train)
cv=xgb.cv(data = dtrain, nround=10, nfold = 5, objective="binary:logistic")
preds=predict(xgmodel,X_test)
prediction=as.numeric(preds>0.543)
prediction

# Measuring model performance
error_value = mean(as.numeric(preds > 0.5) != Y_test)
print(paste("test-error=", error_value))


# View feature importance from the learnt model
importance_matrix = xgb.importance(model = xgmodel)
print(importance_matrix)

sum(importance_matrix$Frequence)
sum(importance_matrix$Cover)
sum(importance_matrix$Gain)



#Find AUC for this
library(pROC)
auc<-auc(Y_test,prediction)
print(paste('AUC Score:',auc))
rocg<-roc(Y_test,prediction)
plot(rocg, col="blue")
tablesamp <- table(prediction, Y_test)
tablesamp
library(class)

#Let's run another classification algorithm to test if our data is valid.
#This is a small script I wrote to automate and test for accuracy for up to
#k cases of KNN classification.
"Enter number of cases you wanna test for training data,
testdata, trainresponse and testresponse"
#Testing for accuracy which is TP + TN/ Total No. of Test Cases
getknnerr <-function(n, traindata, testdata, trainresp, testresp) {
  
  ncount=0
  err=0
  errcount=0
  tablen=0
  knnsamp <- knn(traindata, testdata, trainresp, k=1)
  tablesamp <- table(knnsamp, testresp)
  print(tablesamp)
  err=(tablesamp[1,1]+tablesamp[2,2])/(nrow(testdata))
  cat("Base error at k=1 :",err)
  for(i in 2:n){
    knnsamp2 <- knn(traindata, testdata, trainresp, k=i)
    tablesamp2 <- table(knnsamp2, testresp)
    errcheck=(tablesamp2[1,1]+tablesamp2[2,2])/(nrow(testdata))
    if(errcheck>err){
      ncount=i
      err=errcheck
      tablen=tablesamp2
    }
  }
  cat("\nfinal accuracy score:",err)
  cat("\nachieved at k=",ncount)
  tablen
  return(ncount)
}
#The function returns the k value with the highest accuracy.
knn<-getknnerr(10, traindata = X_train, testdata = X_test,trainresp = Y_train,testresp = Y_test)
knnreturn <- knn(X_train, X_test, Y_train, k=knn)
tablesamp <- table(knnreturn, Y_test)
tablesamp
knnreturn <- sapply(knnreturn, as.numeric)
#Plot roc curve
rocg <- roc(Y_test,knnreturn)
plot(rocg)
aucsc <- auc(Y_test,knnreturn)
aucsc
#This library helps us visualise the xgboost trees
library(DiagrammeR)
xgb.plot.tree(model = xgmodel)
# View only the first tree in the XGBoost model
xgb.plot.tree(model = xgmodel, tress= 10)
xgb.plot.tree(model = xgmodel, trees = 10)


