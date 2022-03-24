DROP DATABASE IF EXISTS pogemon;
CREATE DATABASE pogemon;
USE pogemon;

DROP PROCEDURE if EXISTS pogPro;
Delimiter //
CREATE PROCEDURE pogPro()
BEGIN 

CREATE TABLE Player(
	PlayerEmail VARCHAR(30) NOT NULL PRIMARY KEY,
	PlayerPassword VARCHAR(30) NOT NULL,
	 INT NOT NULL, 
	TileID INT NOT NULL,
	TileRow INT NOT NULL,
	TileColumn INT NOT NULL,
	Score INT,
	LoginCount INT,
	LockOut INT,
	IsAdmin BOOL,
	FOREIGN KEY (TileId) REFERENCES TileType(TileId)
);

CREATE TABLE Tile(
	TileRow INT NOT NULL, 
	TileColumn INT NOT NULL,
	TileId INT NOT NULL, 
	FOREIGN KEY (TileId) REFERENCES TileType(TileId)
);

CREATE TABLE Item(
	ItemId INT NOT NULL PRIMARY KEY,
	ItemDescription VARCHAR(30)
    -- In here I need to figure out how to create different classes of items that do different tingz 
);

CREATE TABLE PlayerAsset(
	AssetId INT NOT NULL,
	PlayerId INT NOT NULL,
	FOREIGN KEY(AssetId) REFERENCES Player(AssetId),
	FOREIGN KEY (PlayerId) REFERENCES Player(PlayerId)
);

CREATE TABLE Chat(
	ChatId INT NOT NULL PRIMARY KEY,
	Message VARCHAR (100) NOT NULL,
	FromId VARCHAR (30) NOT NULL,
	ToId INT NOT NULL,
	FOREIGN KEY (FromId) REFERENCES Player(PlayerEmail),
	FOREIGN KEY (ToId) REFERENCES Player(PlayerEmail)
);

CREATE TABLE Map(
	MapId INT NOT NULL PRIMARY KEY,
	HomeTileRow INT NOT NULL,
	HomeTileColumn INT NOT NULL,
	FOREIGN KEY (HomeTileRow) REFERENCES Tile(TileRow),
	FOREIGN KEY (HomeTileColumn) REFERENCES Tile(TileColumn)
);

END //
Delimiter ;

CALL pogPro();