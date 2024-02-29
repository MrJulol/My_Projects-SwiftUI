func add(num1:Int, num2:Int) -> Int{
        return num1+num2;
    }

print(add(num1: 3, num2: 2))

class Test {
    var name:String;
    var ID:Int;

    init(string:String){
        self.name = string;
    }
    init(string:String, ID:Int){
        self.name=string;
        self.ID = ID;
    }

    func printTest(string:String) {
        print(self.name);
    }
    func printTest(ID:Int){
        let output = String(self.name) + " ID: " + String(self.ID);
        print(output);
    }
}

var test = Test(string: "Hello im a Test");

test.printTest(string:test.name)

var test2 = Test(string: "HelloTest2", ID:12048);
test2.printTest(ID:test2.ID)
