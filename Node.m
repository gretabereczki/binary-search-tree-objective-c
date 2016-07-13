// Instead of C's include import is used
#import "Node.h"
 
@implementation Node  // the implementation of class Node
@synthesize left; // automatic getter and setter methods are generated for the fields marked with synthesize keyword
@synthesize right;
@synthesize data;
 
// insert into binary search tree method
-(Node*) insertNode:(Node*) root Object:(NSObject*)data
{    
    Node *current = root;
    Node *previous = nil;
     
    Node *temp = [[Node alloc] init]; // inicialize object temo with the init method, memory allocation with alloc
    temp.data = data;
    temp.left = temp.right = nil; // multiple assignment is possible
    
	
    if(root == nil) // if the tree is empty, the first element is added
	{
        root = temp;
    }
	else // if the tree is not empty
	{
        // looking for the location of the new value
        while (current != nil) 
		{
            previous = current;
            NSString *strValue2 = (NSString*) current.data;
			// if the value to be inserted is smaller than the actual value, then we go to the left in the tree, else to the right
			// works both for numbers and characters
            current = ([data compare:current.data options:(NSCaseInsensitiveSearch | NSAnchoredSearch)] == NSOrderedAscending) ? current.left :current.right;
        }

        if ([data compare:previous.data options:(NSCaseInsensitiveSearch | NSAnchoredSearch)] == NSOrderedAscending)
		{
            previous.left = temp;
        }
		else
		{
            previous.right = temp;
        }
    }
    return root;
}
 
// delete value from the binary search tree method
-(Node*) deleteNode:(Node*) root Value:(NSObject*) value
{   
    if (root == nil) // ha a fa üres
	{
        return root;
    }
     
    Node *current = root;
    Node *parent; // the parent node of the node to be deleted
    while (current != nil &&  [value compare:current.data options:(NSCaseInsensitiveSearch | NSAnchoredSearch)] != NSOrderedSame ) 
	{
        parent = current;
		// if the value to be deleted is smaller than the actual value, then we go to the left in the tree, else to the right
        current = [value compare:current.data options:(NSCaseInsensitiveSearch | NSAnchoredSearch)] == NSOrderedAscending ? current.left : current.right;
    }
     
    if (current == nil) // if the value cannot be found in the tree
	{
        return root;
    }
     
    Node *helper;
	Node *suc;
    if (current.left == nil) // if the left subtree of the node to be deleted is empty
	{
        helper = current.right;
    }
	else if (current.right == nil) // if the right subtree of the node to be deleted is empty
	{
        helper = current.left;
    }
	else // if none of the subtrees of the node to be deleted is empty
	{
        suc = current.right;
        while (suc.left != nil) 
		{
            suc = suc.left;
        }
        suc.left = current.left;
        helper = current.right;
    }
     
    if (parent == nil) 
	{
        return helper;
    }
    if (current == parent.left) 
	{
        parent.left = helper;
    }
	else
	{
        parent.right = helper;
    }
    current = nil;
    return root;
}
 
// inorder traversal using recursion 
-(void) inorderTraversal:(Node*)root
{
    if(root != nil)
	{
		// self is the object for the actual instance 
        [self inorderTraversal:root.left];
		// NSLog writes data on the console, similar to C's printf method
        NSLog(@"%@ ", root.data);
        [self inorderTraversal:root.right];
    }
}

@end // end keyword marks the end of the implementation