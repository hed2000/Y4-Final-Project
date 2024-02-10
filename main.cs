using Godot;
using System;

using MongoDB.Driver;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Driver.Linq;

public partial class main : Node
{
		
	//private int Money;
	private static IMongoCollection<User> usersCollection;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		//Money = 150;
		//var label = GetNode<Label>("MoneyLabel");
		//label.Text = Money.ToString();
		
		const string connectionUri = "mongodb+srv://application:application4password@cluster0.64h8yuk.mongodb.net/?retryWrites=true&w=majority";
		var settings = MongoClientSettings.FromConnectionString(connectionUri);

		// Set the ServerApi field of the settings object to set the version of the Stable API on the client
		settings.ServerApi = new ServerApi(ServerApiVersion.V1);

		// Create a new client and connect to the server
		var client = new MongoClient(settings);
		var applicationDatabase = client.GetDatabase("application");
		usersCollection = applicationDatabase.GetCollection<User>("user");

		// Send a ping to confirm a successful connection
		try {
		  var result = client.GetDatabase("admin").RunCommand<BsonDocument>(new BsonDocument("ping", 1));
		  GD.Print("Pinged your deployment. You successfully connected to MongoDB!");
		} catch (Exception ex) {
		 GD.Print(ex);
		}
		
		var query =
			(from c in usersCollection.AsQueryable<User>()
			select c);
		GD.Print(query.ToList());
		
	}

}

[Serializable]

public class User
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public string Id { get; set; }
	[BsonElement("name"), BsonRepresentation(BsonType.String)]
	public string Name { get; set; }
	[BsonElement("exp"), BsonRepresentation(BsonType.Int32)]
	public int Exp { get; set; }
	[BsonElement("money"), BsonRepresentation(BsonType.Int32)]
	public int Money { get; set; }
	[BsonElement("petType"), BsonRepresentation(BsonType.String)]
	public string PetType { get; set; }
	[BsonElement("password"), BsonRepresentation(BsonType.String)]
	public string Password { get; set; }
}
