using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace loginregister.Models
{
    public partial class mentorContext : DbContext
    {
        public mentorContext()
        {
        }

        public mentorContext(DbContextOptions<mentorContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Admin> Admin { get; set; }
        public virtual DbSet<Mentordtls> Mentordtls { get; set; }
        public virtual DbSet<Mentorskills> Mentorskills { get; set; }
        public virtual DbSet<Skills> Skills { get; set; }
        public virtual DbSet<Training> Training { get; set; }
        public virtual DbSet<Userdtls> Userdtls { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=mentor;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>(entity =>
            {
                entity.HasKey(e => e.AId);

                entity.ToTable("admin");

                entity.Property(e => e.AId).HasColumnName("a_id");

                entity.Property(e => e.APassword)
                    .HasColumnName("a_password")
                    .HasMaxLength(50);

                entity.Property(e => e.AUsername)
                    .HasColumnName("a_username")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Mentordtls>(entity =>
            {
                entity.HasKey(e => e.MId);

                entity.ToTable("mentordtls");

                entity.HasIndex(e => e.MUsername)
                    .HasName("UQ__mentorDt__5D59886D1B8BF3A3")
                    .IsUnique();

                entity.Property(e => e.MId).HasColumnName("m_id");

                entity.Property(e => e.MActive)
                    .HasColumnName("m_active")
                    .HasMaxLength(10);

                entity.Property(e => e.MLinkedinurl)
                    .IsRequired()
                    .HasColumnName("m_linkedinurl")
                    .HasMaxLength(100);

                entity.Property(e => e.MPassword)
                    .IsRequired()
                    .HasColumnName("m_password")
                    .HasMaxLength(50);

                entity.Property(e => e.MRegcode)
                    .HasColumnName("m_regcode")
                    .HasMaxLength(10);

                entity.Property(e => e.MRegdattime)
                    .HasColumnName("m_regdattime")
                    .HasColumnType("datetime");

                entity.Property(e => e.MUsername)
                    .IsRequired()
                    .HasColumnName("m_username")
                    .HasMaxLength(50);

                entity.Property(e => e.MYearsofexperience).HasColumnName("m_yearsofexperience");
            });

            modelBuilder.Entity<Mentorskills>(entity =>
            {
                entity.HasKey(e => e.MsId);

                entity.ToTable("mentorskills");

                entity.Property(e => e.MsId)
                    .HasColumnName("ms_id")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.MsFacilitiesoffered)
                    .HasColumnName("ms_facilitiesoffered")
                    .HasMaxLength(100);

                entity.Property(e => e.MsMid).HasColumnName("ms_mid");

                entity.Property(e => e.MsSelfrating)
                    .HasColumnName("ms_selfrating")
                    .HasColumnType("decimal(3, 1)");

                entity.Property(e => e.MsSid).HasColumnName("ms_sid");

                entity.Property(e => e.MsTrainingdelivered).HasColumnName("ms_trainingdelivered");

                entity.Property(e => e.MsYearsofexperience).HasColumnName("ms_yearsofexperience");

                entity.HasOne(d => d.Ms)
                    .WithOne(p => p.InverseMs)
                    .HasForeignKey<Mentorskills>(d => d.MsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_mentorskills_mentorskills");

                entity.HasOne(d => d.MsS)
                    .WithMany(p => p.Mentorskills)
                    .HasForeignKey(d => d.MsSid)
                    .HasConstraintName("ms_me_FK");
            });

            modelBuilder.Entity<Skills>(entity =>
            {
                entity.HasKey(e => e.SkId);

                entity.ToTable("skills");

                entity.HasIndex(e => e.SkName)
                    .HasName("UQ__skills__F639279DCCBF3316")
                    .IsUnique();

                entity.Property(e => e.SkId).HasColumnName("sk_Id");

                entity.Property(e => e.SkDuration).HasColumnName("sk_Duration");

                entity.Property(e => e.SkName)
                    .IsRequired()
                    .HasColumnName("sk_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.SkPrerequistes)
                    .HasColumnName("sk_Prerequistes")
                    .HasMaxLength(50);

                entity.Property(e => e.SkToc)
                    .IsRequired()
                    .HasColumnName("sk_TOC")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Training>(entity =>
            {
                entity.HasKey(e => e.TrId);

                entity.ToTable("training");

                entity.Property(e => e.TrId).HasColumnName("tr_id");

                entity.Property(e => e.TrMid).HasColumnName("tr_mid");

                entity.Property(e => e.TrSid).HasColumnName("tr_sid");

                entity.Property(e => e.TrStatus)
                    .HasColumnName("tr_status")
                    .HasMaxLength(20);

                entity.Property(e => e.TrUid).HasColumnName("tr_uid");

                entity.HasOne(d => d.TrM)
                    .WithMany(p => p.Training)
                    .HasForeignKey(d => d.TrMid)
                    .HasConstraintName("tr_me_FK");

                entity.HasOne(d => d.TrS)
                    .WithMany(p => p.Training)
                    .HasForeignKey(d => d.TrSid)
                    .HasConstraintName("tr_sk_FK");

                entity.HasOne(d => d.TrU)
                    .WithMany(p => p.Training)
                    .HasForeignKey(d => d.TrUid)
                    .HasConstraintName("tr_us_FK");
            });

            modelBuilder.Entity<Userdtls>(entity =>
            {
                entity.ToTable("userdtls");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Active)
                    .HasColumnName("active")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Contactnumber)
                    .HasColumnName("contactnumber")
                    .HasColumnType("numeric(10, 0)");

                entity.Property(e => e.Firstname)
                    .IsRequired()
                    .HasColumnName("firstname")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Lastname)
                    .IsRequired()
                    .HasColumnName("lastname")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasColumnName("password")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Regcode)
                    .HasColumnName("regcode")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Regdatetime)
                    .HasColumnName("regdatetime")
                    .HasColumnType("date");

                entity.Property(e => e.Resetpassword)
                    .HasColumnName("resetpassword")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasColumnName("username")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
