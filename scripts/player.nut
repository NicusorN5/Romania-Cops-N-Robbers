class PlayerAcc
{
	constructor(id)
	{
		RefID = id;
	}
	RefID = -1;
	Cash = 0;
	BankCash = 0;
	
	Language = 0;
	Admin = 0;
}
function PlayerAcc::Create(password,email,forumacc)
{
	local p = ::escapeSQLString(password);
	local n = this.GetNameQ();
	local e = ::escapeSQLString(email);
	local f = ::escapeSQLString(forumacc);
	::QuerySQL(db,"INSERT INTO Accounts(Name,Password,Email,ForumAcc,Language,Admin) VALUES ('"+n+"','"+p+"','"+e+"','"+f+"')");
	::QuerySQL(db,"INSERT INTO Players(Name,Cash,BankCash,JobID,");
}
function PlayerAcc::GetInst()
{
	return ::FindPlayer(this.ID);
}
function PlayerAcc::GetNameQ()
{
	return ::escapeSQLString(this.GetInst().Name);
}
function PlayerAcc::SaveLang()
{
	::QuerySQL(db,"UPDATE Players SET Language = '"+this.Language+"' WHERE Name ='"+this.GetNameQ()+"'"); 
}