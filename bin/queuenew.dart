import'dart:io';

class ArrayQueueType {
  late int rear;
  late int front;
  late int length;
  late List arr;
  late int maxSize;

  ArrayQueueType(int size) {
    if (size <= 0) {
      size = 100;
    } else {
      maxSize = size;
    }
    front = 0;
    arr = List.filled(maxSize, 0) as List<int>;
    rear = maxSize - 1;
    length = 0;
  }

  bool isEmpty() {
    return length == 0;
  }

  bool isFull() {
    return length == maxSize;
  }

  void addQueue(var element) {
    if (isFull()) {
      print("Queue is full");
    } else {
      rear = (rear + 1) % maxSize;
      arr[rear] = element;
      length++;
    }
  }

  void deletQueue() {
    if (isEmpty()) {
      print("empty queue can't dequeue");
    } else {
      front = (front + 1) % maxSize;
      length--;
    }
  }

  int frontQueue() {
    assert(!isEmpty());
    return arr[front] as int;
  }

  int rearQueue() {
    assert(!isEmpty());
    return arr[rear] as int;
  }

  void printQueue() {
    if (!isEmpty()) {
      for (var i = front; i != rear; i = (i + 1) % maxSize) {
        stdout.write('${arr[i]} ');
      }
      stdout.write('${arr[rear]}');
    } else {
      print("queue is empty");
    }
  }

  int queueSearch(var element) {
    var pos = -1;
    if (!isEmpty()) {
      for (var i = front; i != rear; i = (i + 1) % maxSize) {
        if (arr[i] == element) {
          pos = 1;
          break;
        }
        if (pos == -1) {
          if (arr[rear] == element) {
            pos = rear;
          }
        }
      }
    } else {
      print("queue is empty");
    }
    return pos;
  }
}

void main() {
  final q1 = ArrayQueueType(5);
  q1.addQueue(10);
  q1.addQueue(20);
  q1.printQueue();
}