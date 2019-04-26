package com.huidi.cruise.algorithm;

import java.util.Comparator;
import java.util.PriorityQueue;

public class Heap<T> extends PriorityQueue {
    public Heap(int initialCapacity, Comparator comparator) {
        super(initialCapacity, comparator);
    }

    public static void main(String[] args) {
        /*Heap<Ship> ships=new Heap<>(18, new Comparator<Ship>() {
            @Override
            public int compare(Ship o1, Ship o2) {
                // the priority higher, freq low
               if(o1.getFreq()*o1.getPriority()>o2.getFreq()*o2.getPriority()){
                   return 1;
               }else if(o1.getFreq()*o1.getPriority()<o2.getFreq()*o2.getPriority()){
                   return -1;
               }else{
                   return Integer.parseInt(o1.getName())>Integer.parseInt(o2.getName())?1:-1;
               }
            }
        });

        for (int i = 1; i <=13 ; i++) {
            Ship ship=new Ship(String.valueOf(i),100);
            ship.setPriority(1);
            ships.add(ship);
        }

        for (int i=14;i<=18;i++){
            Ship ship=new Ship(String.valueOf(i),200);
            ship.setPriority(1);
            ships.add(ship);
        }

        for (int i = 0; i <ships.size() ; i++) {
            Ship ship= (Ship) ships.remove();
            ship.increaseFreq();
            ships.add(ship);
            System.out.println(ship.getName()+" freq: "+ship.getFreq()+" priority: "+ship.getPriority());

        }*/
    }
}
