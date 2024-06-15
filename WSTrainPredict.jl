using CSV, DataFrames, Random, MLJ

WS = CSV.read("CleanWS.csv", DataFrame)
TwoFour = CSV.read("Clean24.csv", DataFrame)

RandomForestClass = @load RandomForestClassifier pkg=DecisionTree
model = RandomForestClass(max_depth=5, n_trees=500)

shuffle!(WS)
Train, Test = partition(WS, .70)
yTrain, XTrain = unpack(Train, ==(:WonWS))
yTest, XTest = unpack(Test, ==(:WonWS))
yTrain = coerce(yTrain, Multiclass)

mach = machine(model, XTrain[:, 2:21], yTrain) |> fit!
yhat = predict(mach, XTest[:, 2:21])
display([yTest yhat])
println(log_loss(yhat, yTest)) 

Prediction = predict(mach, TwoFour[:, 2:21])
TwoFour.WS .= broadcast(pdf, Prediction, 1)
TwoFour.WS .= (TwoFour.WS ./ sum(TwoFour.WS)) .* 100

select!(TwoFour,  :Team, :WS)
sort!(TwoFour, :WS, rev=true)

CSV.write("WSProj1.csv", TwoFour)
println(fitted_params(mach).forest)
FImportant = DataFrame(feature_importances(mach))
show(FImportant)
CSV.write("ParameterImportance.csv", FImportant)
