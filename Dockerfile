FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /build
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o app

FROM registry.access.redhat.com/ubi8/dotnet-80-runtime:8.0 AS final
ENV ASPNETCORE_URLS=http://0.0.0.0:5284 \
    # to get Swagger UI too
    ASPNETCORE_ENVIRONMENT=Development 
COPY --chown=1001:0 --from=build /build/app .
RUN fix-permissions .

EXPOSE 5284

USER 1001

CMD ["dotnet", "wfCSharp.dll"]
