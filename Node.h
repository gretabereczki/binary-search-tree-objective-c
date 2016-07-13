// Instead of C's include import is used
#import <Foundation/Foundation.h>

//specification of Node class
@interface Node : NSObject // all classes have NSObject as a base class
{
	//fields, they are protected by default
    Node *left; // left child
    Node *right; // right child
    NSObject *data; // data contained in the node
}

// declaration of methods that are implemented in the .m filemetódusok deklarációja, amelyeket az implementációban (.m fájl) valósítunk meg
// the name of the method also contains the parameter names
// - is used with instance methods, + with class methods
-(Node*) insertNode:(Node*) root Object:(NSObject*)data; // the method has two parameters: a Node* and a NSObject*, the return value is Node*
-(Node*) deleteNode:(Node*) root Value:(NSObject*) value; // the method has two parameters: a Node* and a NSObject*, the return value is Node*
-(void) inorderTraversal:(Node*) root; //the method has one parameter: Node*, the return value is void
 
// automatic getter and setter method are created for the fields marked with property, 
// if in the implementation the synthesize keyword is used
@property (assign) Node *left; // assign: parameter pass by reference
@property (assign) Node *right;
@property (assign) NSObject *data;
@end  // end keyword marks the end of the specification
 
