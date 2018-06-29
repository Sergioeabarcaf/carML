import pandas
import coremltools
from sklearn.linear_model import LinearRegression

rawData = pandas.read_csv("cars.csv")

model = LinearRegression()
model.fit(rawData[["modelo","extras","kilometraje","estado"]], rawData["precio"])

coreml_model = coremltools.converters.sklearn.convert(model,["modelo","extras","kilometraje","estado"],"precio")
coreml_model.author = "sergioeabarcaf"
coreml_model.license = "CC0"
coreml_model.short_description = "Este modelo predice el valor de venta de un coche segun diversos parametros."

coreml_model.save("Cars.mlmodel")
