# PredictWSJune15
Using Fangraphs plus stats to try and predict WS winner with a Random Forest Model. The data used for the model, its code, and outputs are all in the files. All the data used is from Fangraphs, I used 2010 through 2023 seasons (skipping 2020) to train. The data was from opening day to June 15th for every season. I predicting using data for all games completed through June 14th in the 2024 seasons. Since the games played aren't even for every team in the dataset I used "+ stats" from since they're already normalized. Overall I don't really like the predictions. A team being at 20 percent on June 15th doesn't make much sense to me. For me that makes it a better guide than any type of true probablity. There's some pretty obvious weaknesses; the stats I limited myself too and the model only takes into account who you have been up to this point. It knows nothing about injuries, strength of schedule, or possible playoff path. All it knows is what historic champions looked like on June 15th and how you compare to them right now. 
The first thing I have is I ran 5 random forest models. There's no reason for 5 I just picked it, each has a depth of 5 and 500 trees. I picked those by more art then science, a bunch of attempts and these looked good enough. My only critera was a log loss of .15 or under.

[5Runs.csv](https://github.com/user-attachments/files/15845705/5Runs.csv)Team,WS,WS_1,WS_2,WS_3,WS_4
NYY,16.920473773265652,20.900321543408356,25.543478260869563,16.952054794520546,15.313653136531366
LAD,7.614213197969542,8.842443729903536,11.594202898550723,12.15753424657534,4.612546125461255
NYM,6.091370558375633,6.109324758842442,4.891304347826086,3.9383561643835607,6.6420664206642055
PHI,6.598984771573603,5.62700964630225,8.695652173913043,5.993150684931506,4.797047970479705
TOR,7.106598984771573,5.466237942122186,5.978260869565217,7.191780821917808,11.25461254612546
BOS,6.937394247038917,5.305466237942121,9.96376811594203,2.568493150684931,4.612546125461255
MIL,3.891708967851099,4.340836012861735,2.3550724637681157,3.9383561643835607,6.273062730627306
BAL,5.4145516074450075,4.180064308681671,5.253623188405797,3.0821917808219172,6.4575645756457565
MIN,3.0456852791878166,4.019292604501607,1.4492753623188404,5.136986301369862,4.981549815498155
KCR,4.399323181049069,3.858520900321543,0.7246376811594202,2.73972602739726,2.952029520295203
TBR,4.230118443316413,3.697749196141478,3.2608695652173907,5.136986301369862,4.797047970479705
ATL,3.2148900169204735,3.37620578778135,1.2681159420289854,2.73972602739726,2.952029520295203
CIN,3.891708967851099,3.37620578778135,3.079710144927536,2.054794520547945,4.059040590405903
SFG,3.0456852791878166,3.215434083601286,2.1739130434782608,4.965753424657534,6.273062730627306
ARI,3.3840947546531295,2.0900321543408356,1.9927536231884055,1.883561643835616,1.8450184501845017
SEA,1.1844331641285955,1.9292604501607715,2.1739130434782608,1.36986301369863,1.6605166051660514
CHC,0.5076142131979695,1.9292604501607715,0.5434782608695652,1.0273972602739725,1.4760147601476015
CHW,1.6920473773265647,1.9292604501607715,1.4492753623188404,3.0821917808219172,1.2915129151291511
DET,2.1996615905245345,1.768488745980707,0.7246376811594202,2.73972602739726,1.4760147601476015
HOU,2.1996615905245345,1.768488745980707,2.7173913043478257,2.3972602739726026,0.0
STL,1.1844331641285955,1.2861736334405143,0.3623188405797101,1.1986301369863013,1.107011070110701
CLE,0.8460236886632824,1.2861736334405143,1.0869565217391304,0.8561643835616438,1.107011070110701
TEX,0.5076142131979695,1.12540192926045,0.18115942028985504,1.36986301369863,0.36900369003690037
OAK,0.6768189509306259,1.12540192926045,0.5434782608695652,1.5410958904109586,0.9225092250922509
LAA,1.5228426395939083,0.6430868167202571,0.18115942028985504,1.7123287671232876,1.107011070110701
PIT,0.16920473773265648,0.32154340836012857,0.5434782608695652,0.17123287671232876,0.36900369003690037
WSN,1.1844331641285955,0.32154340836012857,0.3623188405797101,0.5136986301369862,0.7380073800738007
COL,0.33840947546531297,0.16077170418006428,0.9057971014492752,1.36986301369863,0.18450184501845018
SDP,0.0,0.0,0.0,0.17123287671232876,0.36900369003690037

