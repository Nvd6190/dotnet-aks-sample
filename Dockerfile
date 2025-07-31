FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ./app/ ./app/
RUN dotnet restore app/dotnet-aks-app.csproj
RUN dotnet publish app/dotnet-aks-app.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "dotnet-aks-app.dll"]
