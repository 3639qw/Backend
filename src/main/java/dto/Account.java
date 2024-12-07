package dto;

public class Account {
    private String userid;
    private String name;
    private String num;

    public Account(String id, String bankName, String accountNumber) {
        this.userid = id;
        this.name = bankName;
        this.num = accountNumber;
    }

    public String getId() {
        return userid;
    }

    public String getBankName() {
        return name;
    }

    public String getAccountNumber() {
        return num;
    }
}