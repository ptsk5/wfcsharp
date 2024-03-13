FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /build
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o app

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
ENV ASPNETCORE_URLS=http://0.0.0.0:5284 \
    # to get Swagger UI too
    ASPNETCORE_ENVIRONMENT=Development 
WORKDIR /app
COPY --from=build /build/app .
EXPOSE 5284

ENTRYPOINT ["dotnet", "wfCSharp.dll"]
