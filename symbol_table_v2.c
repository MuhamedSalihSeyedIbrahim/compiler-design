#include<stdio.h>
#include<malloc.h>
#include<string.h>

void create();
void search();
void display();
struct node {
  char data[100];
  struct node *next;
} *start;
void main(){
    int ch;
    while(1){
        printf("Enter the options \n1.create\n2.display\n3.search\n4.exit");
        scanf("%d",&ch);
        switch(ch){
            case 1: create(); break;
            case 2:display(); break;
            case 3:search(); break;
            case 4:goto bp;
            default:printf("Enter a valid option"); break;
        }
    }
    bp:printf("Terminated");
}

void create(){
    struct node *tmp,*q;
    tmp=malloc(sizeof(struct node));
    printf("Enter the data");
    scanf("%s",tmp->data);
    tmp->next=NULL;
    if(start==NULL){
      start=tmp;
    }
    else {
      q=start;
      while(q->next!=NULL){
          q=q->next;
      }
      q->next=tmp;
    }
}

void display(){
  struct node *q;
  q=start;
  if(start==NULL){
    printf("symbol table is empty");
    }
  else {
    while(q!=NULL){
      printf("%s  ",q->data);
      q=q->next;
    }
      printf("\n");
  }
}

void search(){
  struct node *q;
  char x[100];
  int c=0;
  printf("Enter the data\n");
  scanf("%s",x);
  q=start;
  while(q!=NULL){
    c++;
    if(strcmp(x,q->data)==0){
      printf("Element found at %d position\n",c); break;
    }
    q=q->next;
  }
}
