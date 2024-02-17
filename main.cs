using Godot;
using System;
using System.Collections.Generic;

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
	public Godot.Collections.Array<string> taskId = new Godot.Collections.Array<string>(); 
	public Godot.Collections.Array<string> taskName = new Godot.Collections.Array<string>();
	public Godot.Collections.Array<int> taskMoney = new Godot.Collections.Array<int>();
	public Godot.Collections.Array<int> taskExp = new Godot.Collections.Array<int>(); 
	
	private ObjectId userId; 
	private string passwordHash;
	private string confirmPasswordHash;
	private IMongoDatabase applicationDatabase;
	private IMongoCollection<User> usersCollection; 
	private IMongoCollection<Task> tasksCollection; 
	private IMongoCollection<Skins> skinsCollection; 
	
	public void init() {
		
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
		
	}
	
	public void get_user_info() {
		
		usersCollection = applicationDatabase.GetCollection<User>("user");
		
		var result = usersCollection.Find(u => u.Id == userId).First(); 
		userMoney = result.Money; 
		userExp = result.Exp;
		userPetType = result.PetType; 
		
		GD.Print($"{result.Id}, {result.Name}, {result.Exp}, {result.Money}, {result.PetType}, {result.Password}");
		
	}
	
	public void get_pet_skin() {
		var activeSkinsCollection = applicationDatabase.GetCollection<ActiveSkin>("active skin");
		var activeSkinResults = activeSkinsCollection.Find(s => s.UserId == userId).ToList(); 
		var activeSkin = activeSkinResults[0];
		
		skinsCollection = applicationDatabase.GetCollection<Skins>("skins");
		var results = skinsCollection.Find(s => s.Name == activeSkin.SkinName).ToList(); 
		var result = results[0];
		headPath = result.HeadPath; 
		bodyPath = result.BodyPath;
		tailPath = result.TailPath;
	}
	
	public void add_task(String name, int money, int exp) {
		tasksCollection = applicationDatabase.GetCollection<Task>("tasks");
		var activeTasksCollection = applicationDatabase.GetCollection<ActiveTask>("active tasks");
		
		ObjectId id = ObjectId.GenerateNewId();
		
		var task = new Task {Id = id, Name = name, Money = money, Exp = exp, Type = "custom"};
		var activeTask = new ActiveTask {TaskId = id, UserName = userName};
		tasksCollection.InsertOne(task);
		activeTasksCollection.InsertOne(activeTask);
		
	}
	
	public void get_tasks() {
		tasksCollection = applicationDatabase.GetCollection<Task>("tasks");
		var activeTasksCollection = applicationDatabase.GetCollection<ActiveTask>("active tasks");
		var activeTaskResults = activeTasksCollection.Find(t => t.UserName == userName).ToList();
		var taskResults = new List<Task>(); 
		foreach (ActiveTask item in activeTaskResults) {
			var resultList = tasksCollection.Find(t => t.Id == item.TaskId).Limit(1).ToList();
			taskResults.Add(resultList[0]);
		}
		foreach (Task item in taskResults) {
			taskId.Add(item.Id.ToString());
			taskName.Add(item.Name);
			taskMoney.Add(item.Money);
			taskExp.Add(item.Exp);
		}
	}
	
	public void button_pressed(String id) {
		GD.Print(id);
	}
	
	public void update_money(int amount) {
		GD.Print(amount);
		var filter = Builders<User>.Filter
			.Eq(u => u.Id, userId);
		
		var oldUser = usersCollection.Find(filter).First();
		GD.Print(oldUser.Name);
		
		GD.Print(userMoney);
		userMoney += amount; 
		GD.Print(userMoney);
		
		var newUser = new User {Id = oldUser.Id, Name = oldUser.Name, Exp = oldUser.Exp, Money = userMoney, PetType = oldUser.PetType, Password = oldUser.Password};
		usersCollection.ReplaceOne(filter, newUser);
	}
	
	public void set_password(string password) {
		passwordHash = password;
	}
	
	public void set_confirm_password(string password) {
		confirmPasswordHash = password;
	}
	
	public string login() {
		usersCollection = applicationDatabase.GetCollection<User>("user");
		try {
			var results = usersCollection.Find(u => u.Name == userName).First(); 
			if (passwordHash == results.Password) {
				userId = results.Id; 
				return("login successful");
			}
			return "username or password is incorrect";
		} catch (Exception ex) {
			return "username or password is incorrect";
		}
		
		return "unknown error";
	}

}

[Serializable]

public class User
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public ObjectId Id { get; set; }
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

public class Task
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public ObjectId Id { get; set; }
	[BsonElement("name"), BsonRepresentation(BsonType.String)]
	public string Name { get; set; }
	[BsonElement("money"), BsonRepresentation(BsonType.Int32)]
	public int Money { get; set; }
	[BsonElement("exp"), BsonRepresentation(BsonType.Int32)]
	public int Exp { get; set; }
	[BsonElement("type"), BsonRepresentation(BsonType.String)]
	public string Type { get; set; }
}

public class Skins
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public ObjectId Id { get; set; }
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

public class ActiveSkin
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public ObjectId Id { get; set; }
	[BsonElement("user_name"), BsonRepresentation(BsonType.String)]
	public string UserName { get; set; }
	[BsonElement("skin_name"), BsonRepresentation(BsonType.String)]
	public string SkinName { get; set; }
	[BsonElement("user_id"), BsonRepresentation(BsonType.ObjectId)]
	public ObjectId UserId { get; set; }
}

public class ActiveTask
{
	
	[BsonId, BsonElement("_id"), BsonRepresentation(BsonType.ObjectId)]
	public ObjectId Id { get; set; }
	[BsonElement("user_name"), BsonRepresentation(BsonType.String)]
	public string UserName { get; set; }
	[BsonElement("task_id"), BsonRepresentation(BsonType.ObjectId)]
	public ObjectId TaskId { get; set; }
}
