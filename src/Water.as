package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jonathan Aronsson Olsson
	 */
	public class Water extends Sprite
	{
		[Embed(source = "water.png")]
		private var water:Class;
		
		[Embed(source = "explosions.png")]
		private var explosions:Class;
		
		[Embed(source = "miss explosion.jpg")]
		private var explosionMiss:Class;
		
		public static const BOX_SIDE:int = 30;
		
		public function Water() 
		{	
			this.graphics.beginBitmapFill(Bitmap(new water()).bitmapData);
			this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
			this.graphics.endFill();
		}
		
		public function clicked():void 
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(Bitmap(new explosions()).bitmapData);
			this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
			this.graphics.endFill();
		}
		public function explosion():void
		{
			this.graphics.beginBitmapFill(Bitmap(new explosions()).bitmapData);
			this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
			this.graphics.endFill();
		}
		
		public function miss():void 
		{
			this.graphics.beginBitmapFill(Bitmap(new explosionMiss()).bitmapData);
			this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
			this.graphics.endFill();
		}
	}
}