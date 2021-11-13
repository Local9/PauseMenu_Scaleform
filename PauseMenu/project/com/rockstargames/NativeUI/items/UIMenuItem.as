﻿class com.rockstargames.NativeUI.items.UIMenuItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	var rightTextTF;
	var rightText;
	//var rightTextColor = this._textColor;
	var rightBadgeMC;
	var rightBadgeId = com.rockstargames.NativeUI.utils.Badges.NONE;
	var _data;
	var txd_loader;

	function UIMenuItem(str, substr, mc, mainColor, highlightColor, textColor, textHighlightColor)
	{
		super(mc,str,substr);
		this.itemMC = mc.attachMovie("UIMenuItem", "menuItem_" + mc.getNextHighestDepth(), mc.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;
		if ((mainColor != undefined))
		{
			this._mainColor = mainColor;
		}
		if ((highlightColor != undefined))
		{
			this._highlightColor = highlightColor;
		}
		if ((textColor != undefined))
		{
			this._textColor = textColor;
		}
		if ((textHighlightColor != undefined))
		{
			this._textHighlightColor = textHighlightColor;
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,this.leftText,true,true);
		if (this._textColor != com.rockstargames.ui.utils.HudColour.NONE && this._textHighlightColor != com.rockstargames.ui.utils.HudColour.NONE)
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,!this.highlighted ? this._textColor : this._textHighlightColor);
		}

		this.initBaseMouseInterface();
	}


	function SetRightText(str)
	{
		this.rightText = str;
		this.setRightText(this.rightTextTF,this.rightText);
	}

	function SetRightBadge(txd, id)
	{
		this.rightBadgeId = id;
		if (this.rightBadgeId != com.rockstargames.NativeUI.utils.Badges.NONE)
		{
			this.itemMC.RLabelMC._x -= 24;
			this.rightBadgeMC = this.itemMC.createEmptyMovieClip("badge_" + this.itemMC.getNextHighestDepth(), this.itemMC.getNextHighestDepth());
			var sprite_name = com.rockstargames.NativeUI.utils.Badges.getSpriteNameById(id, this.highlighted);
			this.SetClip(this.rightBadgeMC,txd,sprite_name);
		}
		else
		{
			removeMovieClip(this.rightBadgeMC);
			this.itemMC.RLabelMC._x += 24;
		}
	}

	function SetClip(targetMC, textureDict, textureName)
	{
		this.txd_loader = new MovieClipLoader();
		this.txd_loader.addListener(this);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		this.txd_loader.loadClip(_loc2_,targetMC);
	}

	function onLoadInit(target_mc)
	{
		target_mc._width = 24;
		target_mc._height = 24;
		target_mc._x = 263.5;
		target_mc._y = 0.5;
		//com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,!this.highlighted ? this._textColor : this._textHighlightColor);
		delete this.txd_loader;
	}

	function addPanel(_panel)
	{
		this.panels.push(_panel);
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		if (this._textColor != com.rockstargames.ui.utils.HudColour.NONE && this._textHighlightColor != com.rockstargames.ui.utils.HudColour.NONE)
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,!_h ? this._textColor : this._textHighlightColor);
		}
		if (this.rightBadgeMC != undefined)
		{
			var txd = com.rockstargames.NativeUI.utils.Badges.GetSpriteDictionary(this.rightBadgeId);
			var sprite_name = com.rockstargames.NativeUI.utils.Badges.getSpriteNameById(this.rightBadgeId, _h);
			this.SetClip(this.rightBadgeMC,txd,sprite_name);
		}
		for (var _panel in this.panels)
		{
			this.panels[_panel].isVisible = _h;
		}
	}
}