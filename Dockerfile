# Build stage
FROM microsoft/dotnet:2.1-sdk AS build

# set working directory
WORKDIR /app

# Restore
COPY Source/Service/Service.csproj ./Source/Service/
RUN dotnet restore Source/Service/Service.csproj
COPY Source/Process/Process.csproj ./Source/Process/
RUN dotnet restore Source/Process/Process.csproj

# Copy src
COPY . .

# Publish
RUN dotnet publish Source/Process/Process.csproj -o /obj

# Runtime stage
FROM microsoft/dotnet:2.1-runtime

# set working directory
WORKDIR /app

# Copy compiled binaries
COPY --from=build /obj ./bin

# Copy configuration
COPY config/*.* ./config/

EXPOSE 8080

CMD ["dotnet", "./bin/Process.dll", "-c", "./config/config.yml"]
