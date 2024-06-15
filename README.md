Using Fangraphs plus stats to try and predict WS winner with a Random Forest Model. The data used for the model, its code, and outputs are all in the files. All the data used is from Fangraphs, I used 2010 through 2023 seasons (skipping 2020) to train. The data was from opening day to June 15th for every season. I predicting using data for all games completed through June 14th in the 2024 seasons. Since the games played aren't even for every team in the dataset I used "+ stats" from since they're already normalized. Overall I don't really like the predictions. A team being at 20 percent on June 15th doesn't make much sense to me. For me that makes it a better guide than any type of true probablity. There's some pretty obvious weaknesses; the stats I limited myself too and the model only takes into account who you have been up to this point. It knows nothing about injuries, strength of schedule, or possible playoff path. All it knows is what historic champions looked like on June 15th and how you compare to them right now. All of the files I put in here will be cleaner in the files section or by opening them.
The first thing I have is I ran 5 random forest models. There's no reason for 5 I just picked it, each has a depth of 5 and 500 trees. I picked those by more art then science, a bunch of attempts and these looked good enough. My only critera was a log loss of .15 or under.



Team,Prob,Odds
NYY,20.02207900125336,4.994486336495831
LAD,9.384174203603342,10.65623866632846
TOR,7.746176243663237,12.909595244725427
PHI,6.639518912360049,15.061332201922221
BOS,6.152905172781916,16.252485158126845
NYM,5.793783661848574,17.2598781446551
BAL,5.106122202464962,19.584333479470068
TBR,4.4224812402623765,22.61174091358434
MIL,4.35470071383224,22.963690634895006
SFG,4.1191197984565875,24.277031233097293
MIN,3.901152909913402,25.633447934297916
CIN,3.446541007611492,29.014597470088304
KCR,3.072349634220164,32.54837889743705
ATL,2.837170241300908,35.24638689081544
ARI,2.3439970768278333,42.66216924439663
HOU,1.9016690646858385,52.58538504780289
DET,1.865181449468482,53.61408673054134
SEA,1.7415393764047105,57.42046453548653
CHC,1.1481375737400394,87.09757635947025
CLE,1.0850258984525085,92.16369871228193
STL,1.0758633401961446,92.94860812133317
TEX,0.7439015655141251,134.42638735527868
WSN,0.6532356693523421,153.08410837262778
PIT,0.32964580298876317,303.3559022846372
SDP,0.11310949817392485,884.099051047271
CHW,0.00010468515566665524,955245.2720080583
OAK,0.00010468515566665524,955245.2720080583
LAA,0.00010468515566665524,955245.2720080583
COL,0.00010468515566665524,955245.2720080583


