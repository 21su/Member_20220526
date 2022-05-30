package com.its.member.DTO;

import lombok.Data;

@Data
public class PageDTO {
    private int page;
    private int maxPage;
    private int StartPage;
    private int EndPage;
}
