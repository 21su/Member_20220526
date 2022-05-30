package com.its.member.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
    private Long c_id;
    private Long b_id;
    private Long m_id;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;
}
