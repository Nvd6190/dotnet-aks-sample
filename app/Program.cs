using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello from .NET 6 on AKS!");

app.Run();
