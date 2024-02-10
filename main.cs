using Godot;
using System;

using MongoDB.Driver;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Conventions;

public partial class main : Node
{
		
	//private int Money;
	private static IMongoCollection<User> _usersCollection;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		//Money = 150;
		//var label = GetNode<Label>("MoneyLabel");
		//label.Text = Money.ToString();
		
		// Allows automapping of the camelCase database fields to models 
		var camelCaseConvention = new ConventionPack { new CamelCaseElementNameConvention() };
		ConventionRegistry.Register("CamelCase", camelCaseConvention, type => true);
		
		const string connectionUri = "mongodb+srv://application:application4password@cluster0.64h8yuk.mongodb.net/?retryWrites=true&w=majority";
		var settings = MongoClientSettings.FromConnectionString(connectionUri);

		// Set the ServerApi field of the settings object to set the version of the Stable API on the client
		settings.ServerApi = new ServerApi(ServerApiVersion.V1);

		// Create a new client and connect to the server
		var client = new MongoClient(settings);
		var applicationDatabase = client.GetDatabase("application");
		_usersCollection = applicationDatabase.GetCollection<User>("user");

		// Send a ping to confirm a successful connection
		try {
		  var result = client.GetDatabase("admin").RunCommand<BsonDocument>(new BsonDocument("ping", 1));
		  GD.Print("Pinged your deployment. You successfully connected to MongoDB!");
		} catch (Exception ex) {
		 GD.Print(ex);
		}
		
		// start-find-builders
		// Creates a filter for all documents that have a "name" value of "Bagels N Buns"
		var filter = Builders<User>.Filter
			.Eq(r => r.Name, "hed2000");

		// Retrieves the first document that matches the filter
		var user = _usersCollection.Find(filter).FirstOrDefault();
		// end-find-builders

		Console.WriteLine(user.ToBsonDocument());
		
	}

}

public class User
{
	public string Id { get; set; }
	public string Name { get; set; }
	public Int32 Exp { get; set; }
	public Int32 Money { get; set; }
	public string PetType { get; set; }
	public string Password { get; set; }
}
