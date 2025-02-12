﻿class com.rockstargames.PauseMenu.items.StatsTabItem
{
	var itemMC;
	var blipLayer;
	var _isVisible;
	var bar;
	var bgA:Number = 100;
	var itemTextLeft;
	var itemTextRight;
	var _type;
	function StatsTabItem(mc, _type, _label, rightLabel, _colour)
	{
		this.itemMC = mc.attachMovie("statsListItem", "stats_item_" + mc.getNextHighestDepth(), mc.getNextHighestDepth());
		this.bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.itemMC.barMC);
		this.itemTextLeft = this.itemMC.labelMC.titleTF;
		this.itemTextRight = this.itemMC.labelMC.valueTF;
		this._type = _type;
		if (_label != undefined && _label != "")
		{
			com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,_label);
		}
		switch (this._type)
		{
			case 0 :
				if (rightLabel != undefined && rightLabel != "")
				{
					com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,rightLabel);
				}
				this.itemMC.barMC._visible = false;
				break;
			case 1 :
				var _loc4_ = _colour;
				if (_loc4_ == undefined)
				{
					_loc4_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
				}
				this.bar.init(_loc4_);
				if (rightLabel != undefined && rightLabel != "")
				{
					var _loc5_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(rightLabel, 30, 2, 5);
					this.bar.percent(_loc5_);
				}
				this.itemMC.barMC._visible = true;
		}
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
	}

	function updateItem(_label, rightLabel, _colour)
	{
		if (_label != undefined && _label != "")
		{
			com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,_label);
		}
		switch (this._type)
		{
			case 0 :
				if (rightLabel != undefined && rightLabel != "")
				{
					com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,rightLabel);
				}
				this.itemMC.barMC._visible = false;
				break;
			case 1 :
				var _loc4_ = _colour;
				if (_loc4_ == undefined)
				{
					_loc4_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
				}
				this.bar.init(_loc4_,158);
				if (rightLabel != undefined && rightLabel != "")
				{
					var _loc5_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(rightLabel, 30, 2, 5);
					this.bar.percent(_loc5_,true);
				}
				this.itemMC.barMC._visible = true;
		}
	}

	function snapBGGrid(bgMC)
	{
		var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
		bgMC._height = _loc2_ * 27 - 2;
	}

	function set isVisible(_v)
	{
		this._isVisible = _v;
		this.itemMC._visible = _v;
	}
	function get isVisible()
	{
		return this._isVisible;
	}

	function get Value()
	{
		return -1;
	}
}