using Godot;
using System;

public partial class GameData : Node
{
	
	private int Money;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Money = 150;
		var label = GetNode<Label>("MoneyLabel");
		label.Text = Money.ToString();
	}

	private void _on_add_button_pressed()
	{
		Money += 100;
		var label = GetNode<Label>("MoneyLabel");
		label.Text = Money.ToString();
	}
	
	private void _on_button_1_pressed()
	{
		var shop = GetNode<SplitContainer>("shop");
		shop.Show();
	}
	
	private void _on_shop_exit_button_pressed()
	{
		var shop = GetNode<SplitContainer>("shop");
		shop.Hide();
	}
	
	private void changeSprite(string item)
	{
		GD.Print(item);
		if (item == "hat")
		{
			GD.Print("item is hat");
			var catSprite = GetNode<CharacterBody2D>("CatCharacterBody2D");
			catSprite.Hide();
			var hatSprite = GetNode<CharacterBody2D>("HatCharacterBody2D");
			hatSprite.Show();
		}
	}
	
	public void ButtonPressed(string item)
	{
		GD.Print(item);
		if (item == "hat")
		{
			GD.Print("item is hat");
			var sprite = GetNode<AnimatedSprite2D>("catsprite");
			sprite.Play("hat");
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
