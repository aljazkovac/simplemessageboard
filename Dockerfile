FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /usr/src/app
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
RUN adduser -D dotnetuser
COPY --from=build /app/publish .
USER dotnetuser
EXPOSE 8080
CMD [ "dotnet", "SimpleMessageBoard.dll" ]