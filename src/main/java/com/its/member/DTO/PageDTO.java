package com.its.member.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDTO {
    private int page;
    private int maxPage;
    private int StartPage;
    private int EndPage;
}
