<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210415145942 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE "order" DROP CONSTRAINT fk_f52993989395c3f3');
        $this->addSql('DROP INDEX idx_f52993989395c3f3');
        $this->addSql('ALTER TABLE "order" DROP customer_id');
        $this->addSql('ALTER TABLE "order" RENAME COLUMN number TO customer');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE "order" ADD customer_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE "order" RENAME COLUMN customer TO number');
        $this->addSql('ALTER TABLE "order" ADD CONSTRAINT fk_f52993989395c3f3 FOREIGN KEY (customer_id) REFERENCES customer (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX idx_f52993989395c3f3 ON "order" (customer_id)');
    }
}
