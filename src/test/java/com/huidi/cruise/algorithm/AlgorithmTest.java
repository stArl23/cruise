package com.huidi.cruise.algorithm;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.repository.RecordRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.sql.Date;
import java.util.ArrayList;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class AlgorithmTest {

    @Autowired
    private RecordRepository recordRepository;

    private Algorithm algorithm;
    public AlgorithmTest() {
        ArrayList<Berth> startBerthAlgorithms =new ArrayList<>();
        ArrayList<Berth> arriveBerthAlgorithms =new ArrayList<>();
        ArrayList<Ship> smallShips=new ArrayList<>();
        ArrayList<Ship> bigShips=new ArrayList<>();

        for (int i = 1; i <=4 ; i++) {
            Berth berthAlgorithm =new Berth(String.valueOf(i),true,null,null);
            startBerthAlgorithms.add(berthAlgorithm);
        }

        for (int i = 5; i <=7 ; i++) {
            Berth berthAlgorithm =new Berth(String.valueOf(i),true,null,null);
            arriveBerthAlgorithms.add(berthAlgorithm);
        }

        for (int i = 1; i <=8 ; i++) {
            Ship ship=new Ship("S"+String.valueOf(i),100);
            smallShips.add(ship);
        }

        for (int i = 1; i <=5; i++) {
            Ship ship=new Ship("B"+String.valueOf(i),200);
            bigShips.add(ship);
        }
        algorithm= new Algorithm(startBerthAlgorithms, arriveBerthAlgorithms,bigShips,smallShips,new Date(System.currentTimeMillis()));
    }

    @Test
    public void findOpt() {
        ArrayList<com.huidi.cruise.domain.Record> records=algorithm.findOpt(10040);
//        System.out.println(records.get(0));
//        recordRepository.save(records.get(0));
        for (Record r1:records) {
            System.out.println(r1);
        }
        recordRepository.saveAll(records);

    }

    @Test
    public void findMax() {
    }
}