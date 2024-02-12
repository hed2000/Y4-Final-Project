using Godot;
using System;

using MongoDB.Driver;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

public partial class main : Node
{
	public String userName;
	public int userMoney;
	public int userExp;
	public String userPetType; 
	public String headPath;
	public String bodyPath;
	public String tailPath;
	private IMongoDatabase applicationDatabase;
	private IMongoCollection<User> usersCollection; 
	private IMongoCollection<Task> tasksCollection; 
	private IMongoCollection<Skins> skinsCollection; 
	
	public void init() {
		
		userName = "hed2000";
		
		const string connectionUri = "mongodb+srv://admin:admin5password@cluster0.64h8yuk.mongodb.net/?retryWrites=true&w=majority";
		var settings = MongoClientSettings.FromConnectionString(connectionUri);

		// Set the ServerApi field of the settings object to set the version of the Stable API on the client
		settings.ServerApi = new ServerApi(ServerApiVersion.V1);

		// Create a new client and connect to the server
		var client = new MongoClient(settings);
		applicationDatabase = client.GetDatabase("application");

		// Send a ping to confirm a successful connection
		try {
		  var res = client.GetDatabase("admin").RunCommand<BsonDocument>(new BsonDocument("ping", 1));
		  GD.Print("Pinged your deployment. You successfully connected to MongoDB!");
		} catch (Exception ex) {
		 GD.Print(ex);
		}
		
		get_user_info();
		get_pet_skin();
		add_task("test2", 150, 500);
		
	}
	
	public void get_user_info() {
		
		usersCollection = applicationDatabase.GetCollection<User>("user");
		
		var results = usersCollection.Find(u => u.Name == userName).ToList(); 
		var result = results[0]; 
		userMoney = result.Money; 
		userExp = result.Exp;
		userPetType = result.PetType; 
		
		GD.Print($"{result.Id}, {result.Name}, {result.Exp}, {result.Money}, {result.PetType}, {result.Password}");
		
	}
	
	public void get_pet_skin() {
		var activeSkinsCollection = applicationDatabase.GetCollection<ActiveSkin>("active skin");
		var activeSkinResults = activeSkinsCollection.Find(s => s.UserName == userName).ToList(); 
		var activeSkin = activeSkinResults[0];
		
		skinsCollection = applicationDatabase.GetCollection<Skins>("skins");
		var results = skinsCollection.Find(s => s.Name == activeSkin.SkinName).ToList(); 
		var result = results[0];
		headPath = result.HeadPath; 
		bodyPath = result.BodyPath;
		tailPath = result.TailPath;
		GD.Print($"{headPath}, {bodyPath}, {tailPath}");
	}
	
	public void add_task(String name, int money, int exp) {
		tasksCollection = applicationDatabase.GetCollection<Task>("tasks");
		
		var task = new Task { Name = name, Money = money, Exp = exp, Type = "custom"};
		tasksCollection.InsertOne(task);
		
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

[Serializable]

public class Task
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public string Id { get; set; }
	[BsonElement("name"), BsonRepresentation(BsonType.String)]
	public string Name { get; set; }
	[BsonElement("money"), BsonRepresentation(BsonType.Int32)]
	public int Money { get; set; }
	[BsonElement("exp"), BsonRepresentation(BsonType.Int32)]
	public int Exp { get; set; }
	[BsonElement("type"), BsonRepresentation(BsonType.String)]
	public string Type { get; set; }
}

[Serializable]

public class Skins
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public string Id { get; set; }
	[BsonElement("name"), BsonRepresentation(BsonType.String)]
	public string Name { get; set; }
	[BsonElement("pet_type"), BsonRepresentation(BsonType.String)]
	public string PetType { get; set; }
	[BsonElement("price"), BsonRepresentation(BsonType.Int32)]
	public int Price { get; set; }
	[BsonElement("head_path"), BsonRepresentation(BsonType.String)]
	public string HeadPath { get; set; }
	[BsonElement("body_path"), BsonRepresentation(BsonType.String)]
	public string BodyPath { get; set; }
	[BsonElement("tail_path"), BsonRepresentation(BsonType.String)]
	public string TailPath { get; set; }
}

[Serializable]

public class ActiveSkin
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public string Id { get; set; }
	[BsonElement("user_name"), BsonRepresentation(BsonType.String)]
	public string UserName { get; set; }
	[BsonElement("skin_name"), BsonRepresentation(BsonType.String)]
	public string SkinName { get; set; }
}
