using Godot;
using System;

public partial class shopGridContainer : GridContainer
{
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
		var img = GD.Load<Texture2D>("res://button hat.png");
		var button = new Button();
		button.Text = "500";
		button.Icon = img;
		button.Pressed += () => ButtonPressed("hat");
		AddChild(button);
		
		img = GD.Load<Texture2D>("res://button unknown.png");
		button = new Button();
		button.Text = "10000";
		button.Icon = img;
		AddChild(button);
		
		img = GD.Load<Texture2D>("res://button unknown.png");
		button = new Button();
		button.Text = "10000";
		button.Icon = img;
		AddChild(button);
		
		img = GD.Load<Texture2D>("res://button unknown.png");
		button = new Button();
		button.Text = "20000";
		button.Icon = img;
		AddChild(button);
	}
	
	private void ButtonPressed(string item)
	{
		//var base_node = GetNode<Node>("BaseNode");
		//base_node.ButtonPressed(item);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
