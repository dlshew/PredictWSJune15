using CSV, DataFrames

One = CSV.read("WSProj1.csv", DataFrame)
Two = CSV.read("WSProj2.csv", DataFrame)
Three = CSV.read("WSProj3.csv", DataFrame)
Four = CSV.read("WSProj4.csv", DataFrame)
Five = CSV.read("WSProj5.csv", DataFrame)

WSJune = leftjoin(One, Two, on=:Team, makeunique=true)
leftjoin!(WSJune, Three, on=:Team, makeunique=true)
leftjoin!(WSJune, Four, on=:Team, makeunique=true)
leftjoin!(WSJune, Five, on=:Team, makeunique=true)

show(WSJune, allrows=true)
CSV.write("5Runs.csv", WSJune)
WSJune.Prob = (WSJune.WS .+ WSJune.WS_1 .+ WSJune.WS_2 .+ WSJune.WS_3 .+ WSJune.WS_4) ./ 5
select!(WSJune, :Team, :Prob)
@. WSJune.Prob = ifelse(WSJune.Team == "CHW", 0.0001, WSJune.Prob)
@. WSJune.Prob = ifelse(WSJune.Team == "COL", 0.0001, WSJune.Prob)
@. WSJune.Prob = ifelse(WSJune.Team == "OAK", 0.0001, WSJune.Prob)
@. WSJune.Prob = ifelse(WSJune.Team == "LAA", 0.0001, WSJune.Prob)
WSJune.Prob = (WSJune.Prob ./ sum(WSJune.Prob)) .* 100
sort!(WSJune, :Prob, rev=true)
WSJune.Odds = 1 ./ (WSJune.Prob ./ 100)

show(WSJune, allrows=true)
CSV.write("WSJune15.csv", WSJune)