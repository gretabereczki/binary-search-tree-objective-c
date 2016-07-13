// Instead of C's include import is used
#import "Node.m"

//main function
int main(void)
{
	Node *binarySearchTreeString = [[Node alloc] init]; // allocate memory for the Node class, then creat an instance of it
	
	Node *rootString = nil; // insted of C's NULL nil is used
    // initialize array with characters, allocate memory with alloc
	NSArray *arrayString = [[NSArray alloc] initWithObjects:@"b",@"d",@"c",@"f",@"h",@"x",@"y", nil]; // the last element has to be nil
    for (NSObject *val in arrayString) // works like a foreach loop in C#
	{
		// method call with rootArray and val parameters (Smalltalk-like message passing)
		// insert the elements of the array in the tree
        rootString=[binarySearchTreeString insertNode:rootString Object:val];
    }
	
	// call the delete method with root and 'x' parameters
	// @ is for Objective-C objects
    [binarySearchTreeString deleteNode:rootString Value:@"x"];
	[binarySearchTreeString deleteNode:rootString Value:@"d"];
	// the inorder traversal of the tree results an ordered sequence
    [binarySearchTreeString inorderTraversal:rootString];
	
	
	Node *binarySearchTreeInt = [[Node alloc] init]; // allocate memory for the Node class, then creat an instance of it
	Node *rootInt = nil; // insted of C's NULL nil is used
    // initialize array with integers, allocate memory with alloc
	NSArray *arrayInt = [[NSArray alloc] initWithObjects:@"13",@"49",@"51",@"19",@"87",@"33",@"75", nil]; // the last element has to be nil
    for (NSObject *val in arrayInt) // works like a foreach loop in C#
	{
		// method call with rootInt and val parameters (Smalltalk-like message passing)
		// insert the elements of the array in the tree
        rootInt=[binarySearchTreeInt insertNode:rootInt Object:val];
    }
	
	// call the delete method with root and '75' parameters
	// @ is for Objective-C objects
    [binarySearchTreeInt deleteNode:rootInt Value:@"75"];
	[binarySearchTreeInt deleteNode:rootInt Value:@"19"];
	// the inorder traversal of the tree results an ordered sequence
    [binarySearchTreeInt inorderTraversal:rootInt];
	
    return 0;
}
