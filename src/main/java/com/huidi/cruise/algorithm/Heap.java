package com.huidi.cruise.algorithm;

import java.util.Comparator;
import java.util.PriorityQueue;

public class Heap<T> extends PriorityQueue {
    public Heap(int initialCapacity, Comparator comparator) {
        super(initialCapacity, comparator);
    }

    /*public static void main(String[] args) {
        Heap<Ship> ships=new Heap<>(18, new Comparator<Ship>() {
            @Override
            public int compare(Ship o1, Ship o2) {
                // the priority higher, freq low
                return o1.getPriority()*o1.getFreq()-o2.getPriority()*o2.getFreq();
            }
        });

        for (int i = 1; i <=13 ; i++) {
            Ship ship=new Ship(String.valueOf(i),100);
            ship.setPriority(13);
            ships.add(ship);
        }

        for (int i=14;i<=18;i++){
            Ship ship=new Ship(String.valueOf(i),200);
            ship.setPriority(5);
            ships.add(ship);
        }

        for (int i = 0; i <18 ; i++) {
            Ship ship= (Ship) ships.remove();
            ship.increaseFreq();
            ships.add(ship);
            System.out.println(ship.getName()+" freq: "+ship.getFreq()+" priority: "+ship.getPriority());

        }
    }*/
}
