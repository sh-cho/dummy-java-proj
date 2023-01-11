package com.joebrothers.dummyjavaproj.tmp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class TmpController {

    private final Random r = new Random();


    @GetMapping("/hi")
    TmpRecord tt() {
        return new TmpRecord(r.nextInt(), "vince");
    }

}
