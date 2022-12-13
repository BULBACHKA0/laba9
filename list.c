#include <stdlib.h>
#include "list.h"
#include <stdio.h> 
struct ListItem {
 int Value;
 struct ListItem* Next;
};
struct ListItem* Root;
void AddNode( int NewValue ){
 struct ListItem* Item;
 Item = (struct ListItem*) malloc( sizeof(struct ListItem) );
 Item->Value = NewValue;
 Item->Next = Root;
 Root = Item;
}
void CreateList(){
 printf(" Sozdanie spiska.\n");
 Root = NULL;
 AddNode( 50 );
 AddNode( 40 );
 AddNode( 30 );
 AddNode( 20 );
 AddNode( 10 );
}
void ShowList(){
 struct ListItem* Item;
 printf(" Prosmotr spiska.\n");
 Item = Root;
 while (Item != NULL) {
 printf("(%d), ",Item->Value);
 Item = Item->Next;
 }
 printf("\n");
}
void DestroyList(){
 struct ListItem *Item, *Item2;
 printf(" Udalenie spiska.\n");
 Item = Root;
 while (Item != NULL) {
 Item2 = Item->Next;
 free(Item);
 Item = Item2;
 }
 Root = NULL;
}
void ListFunction(){
 printf("Demonstratsyia raboty so spiskom.\n");
 CreateList();
 ShowList();
 DestroyList();
 printf("\n");
}

