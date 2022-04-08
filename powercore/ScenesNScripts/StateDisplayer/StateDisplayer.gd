extends RichTextLabel

func dfs(x, p)->String:
	var ans:=String()
	ans+=x.name+"\n"
	for y in x.get_children():
		if y!=p and y.active:
			ans+= dfs(y,x)
	return ans

func _ready():
	if visible:
		var ans:=String()
		for ch in get_parent().get_children():
			if ch is TreeState:
				print (ch.name)
				ans+=dfs(ch,null)
		text=ans
