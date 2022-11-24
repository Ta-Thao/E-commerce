package com.spring.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cateId")
    private long id;

    @Column(name = "cateName")
    private String categoryName;

    @Column(name = "cateDes")
    private String categoryDescription;

    @OneToMany(mappedBy = "categoryEntity")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<ProductEntity> productCategory;

    @ManyToOne
    @JoinColumn(name = "deleteId")
    private DeleteLogarithmEntity categoryDelete;




    public List<CategoryEntity> getCateList(){
        List<CategoryEntity> cateList = new ArrayList<>();
        if(this.getProductCategory().isEmpty()){
            return new ArrayList<>();
        } else{
            for (ProductEntity item : this.getProductCategory()){
                cateList.add(item.getCategoryEntity());
            }
            return cateList;
        }
    }
}
