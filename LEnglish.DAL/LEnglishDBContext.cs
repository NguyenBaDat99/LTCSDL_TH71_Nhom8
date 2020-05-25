using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace LEnglish.DAL.Models
{
    public partial class LEnglishDBContext : DbContext
    {
        public LEnglishDBContext()
        {
        }

        public LEnglishDBContext(DbContextOptions<LEnglishDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BaiTap> BaiTap { get; set; }
        public virtual DbSet<BangDiem> BangDiem { get; set; }
        public virtual DbSet<CapBac> CapBac { get; set; }
        public virtual DbSet<CauHoi> CauHoi { get; set; }
        public virtual DbSet<DanhMuc> DanhMuc { get; set; }
        public virtual DbSet<NguoiDung> NguoiDung { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            //To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=Dat\\sqlexpress2019;Initial Catalog=LEnglishDB;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiTap>(entity =>
            {
                entity.HasKey(e => e.MaBaiTap)
                    .HasName("PK_bai_tap");

                entity.Property(e => e.MaBaiTap).HasMaxLength(20);

                entity.Property(e => e.DanhMuc).HasMaxLength(10);

                entity.Property(e => e.TenBaiTap)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<BangDiem>(entity =>
            {
                entity.HasKey(e => new { e.MaBangDiem, e.MaBaiTap, e.TenDangNhap })
                    .HasName("PK_bang_diem");

                entity.Property(e => e.MaBaiTap).HasMaxLength(20);

                entity.Property(e => e.TenDangNhap).HasMaxLength(30);

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.TinhTrang).HasMaxLength(20);
            });

            modelBuilder.Entity<CapBac>(entity =>
            {
                entity.HasKey(e => e.MaCapBac)
                    .HasName("PK_cap_bac");

                entity.Property(e => e.MaCapBac).HasMaxLength(20);

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.MoTa).HasMaxLength(100);

                entity.Property(e => e.TenCapBac)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<CauHoi>(entity =>
            {
                entity.HasKey(e => e.MaCauHoi)
                    .HasName("PK_cau_hoi");

                entity.Property(e => e.MaCauHoi).HasMaxLength(20);

                entity.Property(e => e.BaiTap).HasMaxLength(20);

                entity.Property(e => e.NoiDungCauHoi).HasColumnName("NoiDungCauHoi");
            });

            modelBuilder.Entity<DanhMuc>(entity =>
            {
                entity.HasKey(e => e.MaDanhMuc)
                    .HasName("PK_danh_muc");

                entity.Property(e => e.MaDanhMuc).HasMaxLength(10);

                entity.Property(e => e.CapBac).HasMaxLength(20);

                entity.Property(e => e.GhiChu)
                    .HasMaxLength(100)
                    .IsFixedLength();

                entity.Property(e => e.MoTa).HasMaxLength(100);

                entity.Property(e => e.TenDanhMuc)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<NguoiDung>(entity =>
            {
                entity.HasKey(e => e.MaNguoiDung)
                    .HasName("PK_nguoi_dung");

                entity.HasIndex(e => e.TenDangNhap)
                    .HasName("u_tendangnhap")
                    .IsUnique();

                entity.Property(e => e.MaNguoiDung).ValueGeneratedNever();

                entity.Property(e => e.Email).HasMaxLength(30);

                entity.Property(e => e.GioiTinh).HasMaxLength(10);

                entity.Property(e => e.MatKhau)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.NgaySinh).HasColumnType("datetime");

                entity.Property(e => e.TenDangNhap)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.TenNguoiDung)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
