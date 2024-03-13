# wfCSharp

A default webapi project that returns random weather forecasts for the next five days.

## Prerequisites for vscode

- [C# for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)
- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)

## Create a project

```bash
dotnet new webapi --no-https -o wfCSharp
```

## Run project

```bash
dotnet run
curl http://localhost:5284/weatherforecast
```

## API endpoints

- `/weatherforecast` - `WeatherForecast` endpoint
- `/swagger/index.html` - the Swagger page

## Build an image and push it to the image repository

```bash
podman build -t quay.io/jpetnik/wfcsharp:v1 .
podman push quay.io/jpetnik/wfcsharp:v1
```

## Run it locally in the container

```bash
podman run -d --rm -p 5284:5284 quay.io/jpetnik/wfcsharp:v1
curl http://localhost:5284/weatherforecast
```

## Deploy into Red Hat OpenShift Container Platform

```bash
oc new-project wfcsharp
oc apply -f ./deploy
```
