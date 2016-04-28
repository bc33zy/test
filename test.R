setwd("/data/chenbh/Metformin")


### Load FHS

# DNAm Age data
p1    = "/data/chenbh/Horvath_calculator/Horvath_web_calc/"
dna.f = read.csv(paste0(p1, "MethylationData_FHSall.output.csv")) 

# Diabetes (meds) data
meds      = read.csv("/data/OFFSPRING450K/Phenotypes/sabre/OFFGen3_Rx_indicators_v2_11.csv") 
labs      = read.csv("/data/OFFSPRING450K/Phenotypes/sabre/l_fhslab_ex08_1_0257_11.csv")
diabmeds  = subset(meds, diabrx==1, select=c("sabreid"))
diabdata0 = subset(labs, !(RevisedSabreID %in% diabmeds$sabreid))  

# FPG 
diabdata1  =  subset(diabdata0, (GLUC<126)|is.na(GLUC))   

# HbA1c 
diabdata2  = subset(diabdata1, (HBA1C<6.5)|is.na(HBA1C))  



# Metformin data




### Load InCHIANTI data


# DNAm Age data
p4    = "/data/chenbh/InChianti/DNAm/ForUpload_Horvath_calc/"
dna.i = read.csv(paste0(p4,"MethylationData_InChianti.output.csv")) 

# Diabetes data
p5     = "/data/InChianti/InChianti_Phenotypes/Baseline_V6/English/4.Data/SAS_Datasets/Diseases/"
diab.i = haven::read_sas(paste0(p5, "adju_ana.sas7bdat"))

# Metformin data
p6     = "/data/InChianti/InChianti_Phenotypes/Baseline_V6/English/4.Data/SAS_Datasets/Drugs/"
meds.i = haven::read_sas(paste0(p6, "fmc_ana.sas7bdat"))

meds.i$metf    = meds.i$FX1_A10 #0=No
meds.i$insulin = meds.i$FX1_A9  #1=Yes


