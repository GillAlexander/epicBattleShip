package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.sampler.NewObjectSample;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Jonathan Aronsson Olsson
	 */
	public class Main extends Sprite 
	{
		private var map:Vector.<Vector.<Sprite>> = new Vector.<Vector.<Sprite>>(); //Vector inne i en vector
		public const ONE_ROW:int = 10;
		public const BOX_SIDE:int = 30;
		private const BOX_PADDING:int = 3;
		private var score:int = 0;
		private var t:TextField = new TextField();
		private const mapX:int = 100;
		private const mapY:int = 100;
		private var shipX:int = Math.random() * 2;
		private var shipY:int = Math.random() * 2;
		private var extraShipTiles:int = 2;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			t.text = String(score); //Poäng
			addChild(t);
			makeMap(); //Visa mappen på stage
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, resetStage);
		}
		public function clickSquare(m:MouseEvent):void 
		{
			if (m.target.name =="ship") // Of namnet är "Ship"
			{
				Water(m.target).clicked(); 
				score ++; // 1 till poäng
				t.text = String(score); // gör int till sträng
			}
			else 
			{
				Water(m.target).miss(); // Gör om grafiken till en "miss" 
			}
		}
		
		private function resetStage(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32) //Space
			{
				while (map.length > 0) 
				{
					map.splice(0, 0);
					map.shift();
				}
				
				shipX = Math.random() *8;
				shipY = Math.random() *8;
				extraShipTiles =2;
				score = 0;
				t.text = "0";
				addChild(t);
				makeMap();
			}
		}
		
		private function makeMap():void 
		{
			var isHorizontal:Number = Math.random();
			for (var i:int = 0; i < ONE_ROW; i++) //Loopar 10 gånger.
			{
				var rad:Vector.<Sprite> = new Vector.<Sprite>();
				for (var j:int = 0; j < ONE_ROW; j++) 
				{
					var square:Water = new Water();
					square.x = mapX + j * (square.width + BOX_PADDING);
					square.y = mapY + i * (square.height + BOX_PADDING);
					square.addEventListener(MouseEvent.CLICK, clickSquare);
					addChild(square);
					rad.push(square); // Pushar spriten Square 10 gånger in i Vectoren RAD. 10*10 = 100 rutor
					if (i == shipX && j == shipY) 
					{
						/* square.graphics.beginFill(0x808080);
						square.graphics.drawRect(0,0,BOX_SIDE,BOX_SIDE); // Tar bort kommentaren = visa vart skeppet är för att göra det enkelt. 
						square.graphics.endFill(); */
						
						square.name = "ship"; //Ger den square som är targetad namnet "Ship"
						fullShip(isHorizontal); 
					}
				}
				map.push(rad);  // Pushar vectoren RAD in i Vectoren MAP 10 gånger.
			}
		}
		
		private function fullShip(shipHorizOrVerti:Number = 0):void 
		{
			if (extraShipTiles > 0) 
			{
				if (shipHorizOrVerti > 0.5) 
				{
					shipX ++; // Uppdatera skeepkordinaten så att den antligen hamlar med ett x eller ett y. och så gör den om detta till extrashiptiles är noll. 
					extraShipTiles --; 
				}
				else 
				{
					shipY ++;
					extraShipTiles --;
				}
			}
		}
	}
}