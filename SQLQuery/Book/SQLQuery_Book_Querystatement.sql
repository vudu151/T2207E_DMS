--3. Liệt kê các cuốn sách có năm xuất bản từ 2008 đến nay
select Name from Books where PublishYear>2008 and PublishYear<getdate();

--4. Liệt kê 10 cuốn sách có giá bán cao nhất
select top 10 * from Books order by Price desc;

--5. Tìm những cuốn sách có tiêu đề chứa từ “tin học”
--6. Liệt kê các cuốn sách có tên bắt đầu với chữ “T” theo thứ tự giá giảm dần
--7. Liệt kê các cuốn sách của nhà xuất bản Tri thức
--8. Lấy thông tin chi tiết về nhà xuất bản xuất bản cuốn sách “Trí tuệ Do Thái”
--9. Hiển thị các thông tin sau về các cuốn sách: Mã sách, Tên sách, Năm xuất bản, Nhà xuất bản,Loại sách
--10. Tìm cuốn sách có giá bán đắt nhất
--11. Tìm cuốn sách có số lượng lớn nhất trong kho
--12. Tìm các cuốn sách của tác giả “Eran Katz”
--13. Giảm giá bán 10% các cuốn sách xuất bản từ năm 2008 trở về trước
--14. Thống kê số đầu sách của mỗi nhà xuất bản
--15. Thống kê số đầu sách của mỗi loại sách
--16. Đặt chỉ mục (Index) cho trường tên sách
--17. Viết view lấy thông tin gồm: Mã sách, tên sách, tác giả, nhà xb và giá bán
--18. Viết Store Procedure:
      --◦ SP_Them_Sach: thêm mới một cuốn sách
      --◦ SP_Tim_Sach: Tìm các cuốn sách theo từ khóa
      --◦ SP_Sach_ChuyenMuc: Liệt kê các cuốn sách theo mã chuyên mục
--19. Viết trigger không cho phép xóa các cuốn sách vẫn còn trong kho (số lượng > 0)
--20. Viết trigger chỉ cho phép xóa một danh mục sách khi không còn cuốn sách nào thuộc chuyên mục này